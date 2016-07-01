module Map.View exposing (..)

import Keyboard exposing (KeyCode)
import Char exposing (fromCode)
import Map.Model exposing (..)
import Tile
import Html exposing (..)
import Html.Attributes exposing (..)


-- VIEW


view : Model -> Html.Html a
view _ =
    div [ class "map" ]
        [ div [ class "layer0" ]
            (layer0
                |> List.indexedMap viewRow
                |> List.concatMap (\x -> x)
            )
        , div [ class "layer1" ]
            (layer1
                |> List.indexedMap viewRow
                |> List.concatMap (\x -> x)
            )
        ]


viewRow : Int -> List Tile.Kind -> List (Html.Html a)
viewRow rowIndex row =
    row |> List.indexedMap (viewTile rowIndex)


viewTile : Int -> Int -> Tile.Kind -> Html.Html a
viewTile rowIndex colIndex tile =
    Tile.view (Tile.init tile rowIndex colIndex)
