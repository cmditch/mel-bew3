module SaiTub
    exposing
        ( air
        , ask
        , authority
        , axe
        , bid
        , bite
        , cage
        , cap
        , chi
        , cupi
        , Cups
        , cups
        , cupsDecoder
        , din
        , draw
        , drip
        , era
        , exit
        , fee
        , fit
        , flow
        , free
        , gap
        , gem
        , give
        , gov
        , ink
        , join
        , lad
        , lock
        , mat
        , mold
        , off
        , open
        , out
        , owner
        , pep
        , per
        , pie
        , pip
        , pit
        , rap
        , rhi
        , rho
        , rum
        , safe
        , sai
        , setAuthority
        , setOwner
        , setPep
        , setPip
        , setVox
        , shut
        , sin
        , skr
        , tab
        , tag
        , tap
        , tax
        , turn
        , vox
        , wipe
        , LogNewCup
        , logNewCupEvent
        , logNewCupDecoder
        , LogNote
        , logNoteEvent
        , logNoteDecoder
        , LogSetAuthority
        , logSetAuthorityEvent
        , logSetAuthorityDecoder
        , LogSetOwner
        , logSetOwnerEvent
        , logSetOwnerDecoder
        )

import BigInt exposing (BigInt)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline exposing (custom, decode)
import Web3.Eth.Types exposing (..)
import Web3.Evm.Decode exposing (..)
import Web3.Evm.Encode as Evm exposing (..)
import Web3.Utils exposing (keccak256)


{-| "air()" function
-}
air : Address -> Call BigInt
air contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "air()" []
    , nonce = Nothing
    , decoder = toElmDecoder uint
    }


{-| "ask(uint256)" function
-}
ask : Address -> BigInt -> Call BigInt
ask contractAddress wad =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "ask(uint256)" [ UintE wad ]
    , nonce = Nothing
    , decoder = toElmDecoder uint
    }


{-| "authority()" function
-}
authority : Address -> Call Address
authority contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "authority()" []
    , nonce = Nothing
    , decoder = toElmDecoder address
    }


{-| "axe()" function
-}
axe : Address -> Call BigInt
axe contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "axe()" []
    , nonce = Nothing
    , decoder = toElmDecoder uint
    }


{-| "bid(uint256)" function
-}
bid : Address -> BigInt -> Call BigInt
bid contractAddress wad =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "bid(uint256)" [ UintE wad ]
    , nonce = Nothing
    , decoder = toElmDecoder uint
    }


{-| "bite(bytes32)" function
-}
bite : Address -> String -> Call ()
bite contractAddress cup =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "bite(bytes32)" [ StringE cup ]
    , nonce = Nothing
    , decoder = Decode.succeed ()
    }


{-| "cage(uint256,uint256)" function
-}
cage : Address -> BigInt -> BigInt -> Call ()
cage contractAddress fit_ jam =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "cage(uint256,uint256)" [ UintE fit_, UintE jam ]
    , nonce = Nothing
    , decoder = Decode.succeed ()
    }


{-| "cap()" function
-}
cap : Address -> Call BigInt
cap contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "cap()" []
    , nonce = Nothing
    , decoder = toElmDecoder uint
    }


{-| "chi()" function
-}
chi : Address -> Call BigInt
chi contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "chi()" []
    , nonce = Nothing
    , decoder = toElmDecoder uint
    }


{-| "cupi()" function
-}
cupi : Address -> Call BigInt
cupi contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "cupi()" []
    , nonce = Nothing
    , decoder = toElmDecoder uint
    }


{-| "cups(bytes32)" function
-}
type alias Cups =
    { lad : Address
    , ink : BigInt
    , art : BigInt
    , ire : BigInt
    }


cups : Address -> String -> Call Cups
cups contractAddress a =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "cups(bytes32)" [ StringE a ]
    , nonce = Nothing
    , decoder = cupsDecoder
    }


cupsDecoder : Decoder Cups
cupsDecoder =
    evmDecode Cups
        |> andMap address
        |> andMap uint
        |> andMap uint
        |> andMap uint
        |> toElmDecoder


{-| "din()" function
-}
din : Address -> Call BigInt
din contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "din()" []
    , nonce = Nothing
    , decoder = toElmDecoder uint
    }


{-| "draw(bytes32,uint256)" function
-}
draw : Address -> String -> BigInt -> Call ()
draw contractAddress cup wad =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "draw(bytes32,uint256)" [ StringE cup, UintE wad ]
    , nonce = Nothing
    , decoder = Decode.succeed ()
    }


{-| "drip()" function
-}
drip : Address -> Call ()
drip contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "drip()" []
    , nonce = Nothing
    , decoder = Decode.succeed ()
    }


{-| "era()" function
-}
era : Address -> Call BigInt
era contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "era()" []
    , nonce = Nothing
    , decoder = toElmDecoder uint
    }


{-| "exit(uint256)" function
-}
exit : Address -> BigInt -> Call ()
exit contractAddress wad =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "exit(uint256)" [ UintE wad ]
    , nonce = Nothing
    , decoder = Decode.succeed ()
    }


{-| "fee()" function
-}
fee : Address -> Call BigInt
fee contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "fee()" []
    , nonce = Nothing
    , decoder = toElmDecoder uint
    }


{-| "fit()" function
-}
fit : Address -> Call BigInt
fit contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "fit()" []
    , nonce = Nothing
    , decoder = toElmDecoder uint
    }


{-| "flow()" function
-}
flow : Address -> Call ()
flow contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "flow()" []
    , nonce = Nothing
    , decoder = Decode.succeed ()
    }


{-| "free(bytes32,uint256)" function
-}
free : Address -> String -> BigInt -> Call ()
free contractAddress cup wad =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "free(bytes32,uint256)" [ StringE cup, UintE wad ]
    , nonce = Nothing
    , decoder = Decode.succeed ()
    }


{-| "gap()" function
-}
gap : Address -> Call BigInt
gap contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "gap()" []
    , nonce = Nothing
    , decoder = toElmDecoder uint
    }


{-| "gem()" function
-}
gem : Address -> Call Address
gem contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "gem()" []
    , nonce = Nothing
    , decoder = toElmDecoder address
    }


{-| "give(bytes32,address)" function
-}
give : Address -> String -> Address -> Call ()
give contractAddress cup guy =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "give(bytes32,address)" [ StringE cup, AddressE guy ]
    , nonce = Nothing
    , decoder = Decode.succeed ()
    }


{-| "gov()" function
-}
gov : Address -> Call Address
gov contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "gov()" []
    , nonce = Nothing
    , decoder = toElmDecoder address
    }


{-| "ink(bytes32)" function
-}
ink : Address -> String -> Call BigInt
ink contractAddress cup =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "ink(bytes32)" [ StringE cup ]
    , nonce = Nothing
    , decoder = toElmDecoder uint
    }


{-| "join(uint256)" function
-}
join : Address -> BigInt -> Call ()
join contractAddress wad =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "join(uint256)" [ UintE wad ]
    , nonce = Nothing
    , decoder = Decode.succeed ()
    }


{-| "lad(bytes32)" function
-}
lad : Address -> String -> Call Address
lad contractAddress cup =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "lad(bytes32)" [ StringE cup ]
    , nonce = Nothing
    , decoder = toElmDecoder address
    }


{-| "lock(bytes32,uint256)" function
-}
lock : Address -> String -> BigInt -> Call ()
lock contractAddress cup wad =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "lock(bytes32,uint256)" [ StringE cup, UintE wad ]
    , nonce = Nothing
    , decoder = Decode.succeed ()
    }


{-| "mat()" function
-}
mat : Address -> Call BigInt
mat contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "mat()" []
    , nonce = Nothing
    , decoder = toElmDecoder uint
    }


{-| "mold(bytes32,uint256)" function
-}
mold : Address -> String -> BigInt -> Call ()
mold contractAddress param val =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "mold(bytes32,uint256)" [ StringE param, UintE val ]
    , nonce = Nothing
    , decoder = Decode.succeed ()
    }


{-| "off()" function
-}
off : Address -> Call Bool
off contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "off()" []
    , nonce = Nothing
    , decoder = toElmDecoder bool
    }


{-| "open()" function
-}
open : Address -> Call String
open contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "open()" []
    , nonce = Nothing
    , decoder = toElmDecoder string
    }


{-| "out()" function
-}
out : Address -> Call Bool
out contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "out()" []
    , nonce = Nothing
    , decoder = toElmDecoder bool
    }


{-| "owner()" function
-}
owner : Address -> Call Address
owner contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "owner()" []
    , nonce = Nothing
    , decoder = toElmDecoder address
    }


{-| "pep()" function
-}
pep : Address -> Call Address
pep contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "pep()" []
    , nonce = Nothing
    , decoder = toElmDecoder address
    }


{-| "per()" function
-}
per : Address -> Call BigInt
per contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "per()" []
    , nonce = Nothing
    , decoder = toElmDecoder uint
    }


{-| "pie()" function
-}
pie : Address -> Call BigInt
pie contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "pie()" []
    , nonce = Nothing
    , decoder = toElmDecoder uint
    }


{-| "pip()" function
-}
pip : Address -> Call Address
pip contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "pip()" []
    , nonce = Nothing
    , decoder = toElmDecoder address
    }


{-| "pit()" function
-}
pit : Address -> Call Address
pit contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "pit()" []
    , nonce = Nothing
    , decoder = toElmDecoder address
    }


{-| "rap(bytes32)" function
-}
rap : Address -> String -> Call BigInt
rap contractAddress cup =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "rap(bytes32)" [ StringE cup ]
    , nonce = Nothing
    , decoder = toElmDecoder uint
    }


{-| "rhi()" function
-}
rhi : Address -> Call BigInt
rhi contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "rhi()" []
    , nonce = Nothing
    , decoder = toElmDecoder uint
    }


{-| "rho()" function
-}
rho : Address -> Call BigInt
rho contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "rho()" []
    , nonce = Nothing
    , decoder = toElmDecoder uint
    }


{-| "rum()" function
-}
rum : Address -> Call BigInt
rum contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "rum()" []
    , nonce = Nothing
    , decoder = toElmDecoder uint
    }


{-| "safe(bytes32)" function
-}
safe : Address -> String -> Call Bool
safe contractAddress cup =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "safe(bytes32)" [ StringE cup ]
    , nonce = Nothing
    , decoder = toElmDecoder bool
    }


{-| "sai()" function
-}
sai : Address -> Call Address
sai contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "sai()" []
    , nonce = Nothing
    , decoder = toElmDecoder address
    }


{-| "setAuthority(address)" function
-}
setAuthority : Address -> Address -> Call ()
setAuthority contractAddress authority_ =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "setAuthority(address)" [ AddressE authority_ ]
    , nonce = Nothing
    , decoder = Decode.succeed ()
    }


{-| "setOwner(address)" function
-}
setOwner : Address -> Address -> Call ()
setOwner contractAddress owner_ =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "setOwner(address)" [ AddressE owner_ ]
    , nonce = Nothing
    , decoder = Decode.succeed ()
    }


{-| "setPep(address)" function
-}
setPep : Address -> Address -> Call ()
setPep contractAddress pep_ =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "setPep(address)" [ AddressE pep_ ]
    , nonce = Nothing
    , decoder = Decode.succeed ()
    }


{-| "setPip(address)" function
-}
setPip : Address -> Address -> Call ()
setPip contractAddress pip_ =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "setPip(address)" [ AddressE pip_ ]
    , nonce = Nothing
    , decoder = Decode.succeed ()
    }


{-| "setVox(address)" function
-}
setVox : Address -> Address -> Call ()
setVox contractAddress vox_ =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "setVox(address)" [ AddressE vox_ ]
    , nonce = Nothing
    , decoder = Decode.succeed ()
    }


{-| "shut(bytes32)" function
-}
shut : Address -> String -> Call ()
shut contractAddress cup =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "shut(bytes32)" [ StringE cup ]
    , nonce = Nothing
    , decoder = Decode.succeed ()
    }


{-| "sin()" function
-}
sin : Address -> Call Address
sin contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "sin()" []
    , nonce = Nothing
    , decoder = toElmDecoder address
    }


{-| "skr()" function
-}
skr : Address -> Call Address
skr contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "skr()" []
    , nonce = Nothing
    , decoder = toElmDecoder address
    }


{-| "tab(bytes32)" function
-}
tab : Address -> String -> Call BigInt
tab contractAddress cup =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "tab(bytes32)" [ StringE cup ]
    , nonce = Nothing
    , decoder = toElmDecoder uint
    }


{-| "tag()" function
-}
tag : Address -> Call BigInt
tag contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "tag()" []
    , nonce = Nothing
    , decoder = toElmDecoder uint
    }


{-| "tap()" function
-}
tap : Address -> Call Address
tap contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "tap()" []
    , nonce = Nothing
    , decoder = toElmDecoder address
    }


{-| "tax()" function
-}
tax : Address -> Call BigInt
tax contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "tax()" []
    , nonce = Nothing
    , decoder = toElmDecoder uint
    }


{-| "turn(address)" function
-}
turn : Address -> Address -> Call ()
turn contractAddress tap_ =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "turn(address)" [ AddressE tap_ ]
    , nonce = Nothing
    , decoder = Decode.succeed ()
    }


{-| "vox()" function
-}
vox : Address -> Call Address
vox contractAddress =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "vox()" []
    , nonce = Nothing
    , decoder = toElmDecoder address
    }


{-| "wipe(bytes32,uint256)" function
-}
wipe : Address -> String -> BigInt -> Call ()
wipe contractAddress cup wad =
    { to = Just contractAddress
    , from = Nothing
    , gas = Nothing
    , gasPrice = Nothing
    , value = Nothing
    , data = Just <| encodeData "wipe(bytes32,uint256)" [ StringE cup, UintE wad ]
    , nonce = Nothing
    , decoder = Decode.succeed ()
    }


{-| "LogNewCup(address,bytes32)" event
-}
type alias LogNewCup =
    { lad : Address
    , cup : String
    }


logNewCupEvent : Address -> Maybe Address -> LogFilter
logNewCupEvent contractAddress lad =
    { fromBlock = LatestBlock
    , toBlock = LatestBlock
    , address = contractAddress
    , topics =
        [ Just <| keccak256 "LogNewCup(address,bytes32)"
        , Maybe.map (Evm.encode << AddressE) lad
        ]
    }


logNewCupDecoder : Decoder LogNewCup
logNewCupDecoder =
    decode LogNewCup
        |> custom (topic 1 address)
        |> custom (data 0 string)


{-| "LogNote(bytes4,address,bytes32,bytes32,uint256,bytes)" event
-}
type alias LogNote =
    { sig : String
    , guy : Address
    , foo : String
    , bar : String
    , wad : BigInt
    , fax : String
    }


logNoteEvent : Address -> Maybe String -> Maybe Address -> Maybe String -> Maybe String -> LogFilter
logNoteEvent contractAddress sig guy foo bar =
    { fromBlock = LatestBlock
    , toBlock = LatestBlock
    , address = contractAddress
    , topics =
        [ Just <| keccak256 "LogNote(bytes4,address,bytes32,bytes32,uint256,bytes)"
        , Maybe.map (Evm.encode << StringE) sig
        , Maybe.map (Evm.encode << AddressE) guy
        , Maybe.map (Evm.encode << StringE) foo
        , Maybe.map (Evm.encode << StringE) bar
        ]
    }


logNoteDecoder : Decoder LogNote
logNoteDecoder =
    decode LogNote
        |> custom (topic 1 string)
        |> custom (topic 2 address)
        |> custom (topic 3 string)
        |> custom (topic 4 string)
        |> custom (data 0 uint)
        |> custom (data 1 dBytes)


{-| "LogSetAuthority(address)" event
-}
type alias LogSetAuthority =
    { authority : Address
    }


logSetAuthorityEvent : Address -> Maybe Address -> LogFilter
logSetAuthorityEvent contractAddress authority =
    { fromBlock = LatestBlock
    , toBlock = LatestBlock
    , address = contractAddress
    , topics =
        [ Just <| keccak256 "LogSetAuthority(address)"
        , Maybe.map (Evm.encode << AddressE) authority
        ]
    }


logSetAuthorityDecoder : Decoder LogSetAuthority
logSetAuthorityDecoder =
    decode LogSetAuthority
        |> custom (topic 1 address)


{-| "LogSetOwner(address)" event
-}
type alias LogSetOwner =
    { owner : Address
    }


logSetOwnerEvent : Address -> Maybe Address -> LogFilter
logSetOwnerEvent contractAddress owner =
    { fromBlock = LatestBlock
    , toBlock = LatestBlock
    , address = contractAddress
    , topics =
        [ Just <| keccak256 "LogSetOwner(address)"
        , Maybe.map (Evm.encode << AddressE) owner
        ]
    }


logSetOwnerDecoder : Decoder LogSetOwner
logSetOwnerDecoder =
    decode LogSetOwner
        |> custom (topic 1 address)
