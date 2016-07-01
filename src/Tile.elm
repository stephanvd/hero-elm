module Tile exposing (..)

import Html exposing (Html)
import Svg exposing (..)
import Svg.Attributes exposing (..)


type Kind
    = Grass
    | Water
    | Rock
    | Mud


type alias Model =
    { kind : Kind
    , offsetX : Int
    }


init : Kind -> Model
init kind =
    case kind of
        Grass ->
            { kind = Grass, offsetX = 0 }

        Mud ->
            { kind = Grass, offsetX = -64 }

        _ ->
            { kind = Grass, offsetX = 0 }


view : Model -> Html a
view model =
    svg
        [ class "tile"
        , version "1.1"
        , width "64"
        , height "64"
        , x "64"
        , y "0"
        ]
        [ image
            [ xlinkHref "/img/tiles.png"
            , x (toString model.offsetX)
            , y "0"
            , width "320"
            , height "64"
            ]
            []
        ]
