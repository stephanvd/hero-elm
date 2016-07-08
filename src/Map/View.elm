module Map.View exposing (..)

import Map.Model exposing (..)
import Tile
import Dict
import GameObject
import Html exposing (..)
import Html.Attributes exposing (..)
import Hero


-- VIEW


view : Int -> Int -> Hero.Model -> Html.Html a
view offsetX offsetY hero =
    div []
        [ viewLayer groundLayer offsetX offsetY
        , Hero.view hero
        , renderGameObjects gameObjects offsetX offsetY
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


renderGameObjects : SpatialHash -> Int -> Int -> Html.Html a
renderGameObjects gameObjects offsetX offsetY =
    div
        [ class "map"
        , style
            [ ( "left", (toString -offsetX) ++ "px" )
            , ( "top", (toString -offsetY) ++ "px" )
            ]
        ]
        (gameObjects
            |> Dict.toList
            |> List.concatMap renderGameObject
        )


renderGameObject : ( ( Int, Int ), List GameObject.Kind ) -> List (Html.Html a)
renderGameObject ( ( x, y ), gameObjects ) =
    List.map (\gameObject -> GameObject.view (GameObject.init x y gameObject)) gameObjects


viewRow : Int -> List Tile.Kind -> List (Html.Html a)
viewRow rowIndex row =
    row |> List.indexedMap (viewTile rowIndex)


viewTile : Int -> Int -> Tile.Kind -> Html.Html a
viewTile rowIndex colIndex tile =
    Tile.view (Tile.init tile rowIndex colIndex)
