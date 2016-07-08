module GameObject exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


type Kind
    = Tree
    | TreeTop
    | Bush
    | Empty


type alias Model =
    { x : Int
    , y : Int
    , kind : Kind
    }


init : Int -> Int -> Kind -> Model
init x y kind =
    { x = x
    , y = y
    , kind = kind
    }


isSolid : Kind -> Bool
isSolid kind =
    [ Tree ]
        |> List.member kind


view : Model -> Html a
view model =
    div
        [ class "tile"
        , style
            [ ( "top", (toString (model.y * 64)) ++ "px" )
            , ( "left", (toString (model.x * 64)) ++ "px" )
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
