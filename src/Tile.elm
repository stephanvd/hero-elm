module Tile exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


type Kind
    = Grass
    | Mud
    | Tree
    | TreeTop
    | Bush


type alias Model =
    { kind : Kind
    , rowIndex : Int
    , colIndex : Int
    }


init : Kind -> Int -> Int -> Model
init kind colIndex rowIndex =
    { kind = kind
    , rowIndex = rowIndex
    , colIndex = colIndex
    }


view : Model -> Html a
view model =
    div
        [ class "tile"
        , style
            [ ( "top", (toString (model.colIndex * 64)) ++ "px" )
            , ( "left", (toString (model.rowIndex * 64)) ++ "px" )
            ]
        ]
        [ img
            [ src "/img/tiles.png"
            , width 320
            , height 64
            , class (toString model.kind)
            ]
            []
        ]
