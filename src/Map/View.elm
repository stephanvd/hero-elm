module Map.View exposing (..)

import Map.Model exposing (..)
import Tile
import Html exposing (..)
import Html.Attributes exposing (..)
import Hero


-- VIEW


view : Int -> Int -> Hero.Model -> Html.Html a
view offsetX offsetY hero =
    div []
        [ viewLayer layer0 offsetX offsetY
        , Hero.view hero
        , viewLayer layer1 offsetX offsetY
        ]


viewLayer : Model -> Int -> Int -> Html.Html a
viewLayer model offsetX offsetY =
    div
        [ class "map"
        , style
            [ ( "left", (toString -offsetX) ++ "px" )
            , ( "top", (toString -offsetY) ++ "px" )
            ]
        ]
        (model
            |> List.indexedMap viewRow
            |> List.concatMap (\x -> x)
        )


viewRow : Int -> List Tile.Kind -> List (Html.Html a)
viewRow rowIndex row =
    row |> List.indexedMap (viewTile rowIndex)


viewTile : Int -> Int -> Tile.Kind -> Html.Html a
viewTile rowIndex colIndex tile =
    Tile.view (Tile.init tile rowIndex colIndex)
