module Abi.Encode
    exposing
        ( Encoding
        , functionCall
        , functionCallWithDebug
        , address
        , uint
        , int
        , bool
        , staticBytes
        , ipfsHash
        , custom
        , abiEncode
        )

{-| Encode before sending RPC Calls

@docs Encoding, functionCall, functionCallWithDebug

@docs address, uint, int, bool, staticBytes, ipfsHash, custom


# Low-Level

@docs abiEncode

-}

import Abi.Int as AbiInt
import BigInt exposing (BigInt)
import Eth.Types exposing (Hex, IPFSHash)
import Eth.Utils as EthUtils exposing (functionSig, ipfsToBytes32)
import Eth.Types exposing (Address)
import Internal.Types as Internal
import Internal.Utils as IU exposing (..)


{-| Not yet implemented : Dynamic Bytes, String, List
-}
type Encoding
    = AddressE Address
    | UintE BigInt
    | IntE BigInt
    | BoolE Bool
    | DBytesE Hex
    | BytesE Hex
    | StringE String
    | ListE Encoding
    | IPFSHashE IPFSHash
    | Custom String


{-| -}
functionCall : String -> List Encoding -> Hex
functionCall =
    functionCall_ False


{-| -}
functionCallWithDebug : String -> List Encoding -> Hex
functionCallWithDebug =
    functionCall_ True



-- Encoders


{-| -}
address : Address -> Encoding
address =
    AddressE


{-| -}
uint : BigInt -> Encoding
uint =
    UintE


{-| -}
int : BigInt -> Encoding
int =
    IntE


{-| -}
bool : Bool -> Encoding
bool =
    BoolE


{-| -}
staticBytes : Hex -> Encoding
staticBytes =
    BytesE


{-| -}
ipfsHash : IPFSHash -> Encoding
ipfsHash =
    IPFSHashE


{-| -}
custom : String -> Encoding
custom =
    Custom



-- Low Level


{-| -}
abiEncode : Encoding -> Hex
abiEncode =
    lowLevelEncode >> Internal.Hex



-- Internal


{-| -}
functionCall_ : Bool -> String -> List Encoding -> Hex
functionCall_ isDebug sig encodings =
    let
        byteCodeEncodings =
            List.map lowLevelEncode encodings
                |> String.join ""

        data_ =
            EthUtils.functionSig sig
                |> EthUtils.hexToString
                |> IU.remove0x
                |> \str -> str ++ byteCodeEncodings

        data =
            if isDebug then
                Debug.log ("Debug Contract Call " ++ sig) data_
            else
                data_
    in
        Internal.Hex data


{-| -}
lowLevelEncode : Encoding -> String
lowLevelEncode enc =
    case enc of
        AddressE (Internal.Address address) ->
            IU.leftPadTo64 address

        UintE uint ->
            BigInt.toHexString uint
                |> IU.leftPadTo64

        IntE int ->
            AbiInt.toString int

        BoolE True ->
            IU.leftPadTo64 "1"

        BoolE False ->
            IU.leftPadTo64 "0"

        DBytesE _ ->
            "not implemeneted yet"

        BytesE (Internal.Hex hexString) ->
            IU.remove0x hexString
                |> IU.leftPadTo64

        StringE string ->
            "not implemeneted yet"

        ListE _ ->
            "not implemeneted yet"

        IPFSHashE ipfsHash ->
            EthUtils.ipfsToBytes32 ipfsHash
                |> \(Internal.Hex zerolessHex) -> zerolessHex

        Custom string ->
            IU.remove0x string
