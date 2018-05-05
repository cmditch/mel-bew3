port module Main exposing (..)

import Html exposing (..)
import Http
import Json.Decode as Decode exposing (Value)
import Task
import Web3.Eth as Eth
import Web3.Eth.Decode as Decode
import Web3.Eth.Types exposing (..)
import Web3.Eth.TxSentry as TxSentry exposing (..)
import Web3.Utils exposing (gwei, unsafeToAddress)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


type alias Model =
    { txSentry : TxSentry Msg
    , account : Maybe Address
    , blockNumber : Maybe Int
    , tx : Maybe Tx
    , txReceipt : Maybe TxReceipt
    , errors : List String
    }


init : ( Model, Cmd Msg )
init =
    { txSentry = TxSentry.init ( txIn, txOut ) TxSentryMsg ethNode
    , account = Nothing
    , blockNumber = Nothing
    , tx = Nothing
    , txReceipt = Nothing
    , errors = []
    }
        ! [ Task.perform PollBlock (Task.succeed <| Ok 0) ]


ethNode : String
ethNode =
    "https://ropsten.infura.io/"



-- View


view : Model -> Html Msg
view model =
    div []
        (List.map viewThing
            [ ( "Current Block", toString model.blockNumber )
            , ( "Tx", toString model.tx )
            , ( "TxReceipt", toString model.txReceipt )
            ]
        )


viewThing : ( String, String ) -> Html Msg
viewThing ( name, val ) =
    div []
        [ div [] [ text name ]
        , div [] [ text val ]
        ]



-- Update


type Msg
    = TxSentryMsg TxSentry.Msg
    | SetAccount (Maybe Address)
    | PollBlock (Result Http.Error Int)
    | InitTx
    | WatchTx Tx
    | WatchTxReceipt TxReceipt
    | NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TxSentryMsg subMsg ->
            let
                ( subModel, subCmd ) =
                    TxSentry.update subMsg model.txSentry
            in
                ( { model | txSentry = subModel }, subCmd )

        SetAccount mAccount ->
            { model | account = mAccount } ! []

        PollBlock blockNumber ->
            { model | blockNumber = Result.toMaybe blockNumber }
                ! [ Task.attempt PollBlock <| Eth.getBlockNumber ethNode ]

        InitTx ->
            case model.account of
                Just account ->
                    let
                        txParams =
                            { to = Just <| unsafeToAddress ""
                            , from = model.account
                            , gas = Nothing
                            , gasPrice = Nothing
                            , value = Just <| gwei 1
                            , data = Nothing
                            , nonce = Nothing
                            }

                        ( newSentry, sentryCmd ) =
                            TxSentry.customSend
                                { onSign = Nothing
                                , onBroadcast = Just WatchTx
                                , onMined = ( WatchTxReceipt, 5 )
                                }
                                txParams
                                model.txSentry
                    in
                        model ! []

                Nothing ->
                    model ! []

        WatchTx tx ->
            { model | tx = Just tx } ! []

        WatchTxReceipt txReceipt ->
            { model | txReceipt = Just txReceipt } ! []

        NoOp ->
            model ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ accountListener accountListenerToMsg
        , TxSentry.listen model.txSentry
        ]


accountListenerToMsg : Value -> Msg
accountListenerToMsg val =
    Decode.decodeValue Decode.address val
        |> Result.toMaybe
        |> SetAccount



-- Ports


port accountListener : (Value -> msg) -> Sub msg


port txOut : Value -> Cmd msg


port txIn : (Value -> msg) -> Sub msg
