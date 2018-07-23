module Contracts.WidgetFactory
    exposing
        ( newWidget
        , sellWidget
        , widgetCount
        , Widget
        , widgets
        , widgetsDecoder
        , WidgetCreated
        , widgetCreatedEvent
        , widgetCreatedDecoder
        , WidgetSold
        , widgetSoldEvent
        , widgetSoldDecoder
        )

import BigInt exposing (BigInt)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (custom, decode)
import Eth.Types exposing (..)
import Eth.Utils as U
import Abi.Decode as Abi exposing (abiDecode, andMap, toElmDecoder, topic, data)
import Abi.Encode as Abi exposing (Encoding(..), abiEncode)


{-| "newWidget(uint256,uint256,address)" function
-}
newWidget : Address -> BigInt -> BigInt -> Address -> Call ()
newWidget contractAddress size_ cost_ owner_ =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| Abi.encodeFunctionCall "newWidget(uint256,uint256,address)" [ UintE size_, UintE cost_, AddressE owner_ ]
    , nonce = Nothing
    , decoder = Decode.succeed ()
    }


{-| "sellWidget(uint256)" function
-}
sellWidget : Address -> BigInt -> Call ()
sellWidget contractAddress id_ =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| Abi.encodeFunctionCall "sellWidget(uint256)" [ UintE id_ ]
    , nonce = Nothing
    , decoder = Decode.succeed ()
    }


{-| "widgetCount()" function
-}
widgetCount : Address -> Call BigInt
widgetCount contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| Abi.encodeFunctionCall "widgetCount()" []
    , nonce = Nothing
    , decoder = toElmDecoder Abi.uint
    }


{-| "widgets(uint256)" function
-}
type alias Widget =
    { id : BigInt
    , size : BigInt
    , cost : BigInt
    , owner : Address
    , wasSold : Bool
    }


widgets : Address -> BigInt -> Call Widget
widgets contractAddress a =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| Abi.encodeFunctionCall "widgets(uint256)" [ UintE a ]
    , nonce = Nothing
    , decoder = widgetsDecoder
    }


widgetsDecoder : Decoder Widget
widgetsDecoder =
    abiDecode Widget
        |> andMap Abi.uint
        |> andMap Abi.uint
        |> andMap Abi.uint
        |> andMap Abi.address
        |> andMap Abi.bool
        |> toElmDecoder


{-| "WidgetCreated(uint256,uint256,uint256,address)" event
-}
type alias WidgetCreated =
    { id : BigInt
    , size : BigInt
    , cost : BigInt
    , owner : Address
    }


widgetCreatedEvent : Address -> LogFilter
widgetCreatedEvent contractAddress =
    { fromBlock = LatestBlock
    , toBlock = LatestBlock
    , address = contractAddress
    , topics = [ Just <| U.keccak256 "WidgetCreated(uint256,uint256,uint256,address)" ]
    }


widgetCreatedDecoder : Decoder WidgetCreated
widgetCreatedDecoder =
    decode WidgetCreated
        |> custom (data 0 Abi.uint)
        |> custom (data 1 Abi.uint)
        |> custom (data 2 Abi.uint)
        |> custom (data 3 Abi.address)


{-| "WidgetSold(uint256)" event
-}
type alias WidgetSold =
    { id : BigInt }


widgetSoldEvent : Address -> LogFilter
widgetSoldEvent contractAddress =
    { fromBlock = LatestBlock
    , toBlock = LatestBlock
    , address = contractAddress
    , topics = [ Just <| U.keccak256 "WidgetSold(uint256)" ]
    }


widgetSoldDecoder : Decoder WidgetSold
widgetSoldDecoder =
    decode WidgetSold
        |> custom (data 0 Abi.uint)


