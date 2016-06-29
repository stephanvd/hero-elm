module Map.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Keyboard exposing (KeyCode)
import Char exposing (fromCode)
import Map.Model exposing (..)


-- VIEW


view : Model -> Html a
view model =
    let
        firstRow =
            model.center.y - 2

        firstCol =
            model.center.x - 2
    in
        div [ class "map" ]
            [ div [ class "" ]
                (model.grid
                    |> List.drop (firstRow - 1)
                    |> List.take 5
                    |> List.map
                        (\row ->
                            div [ class "row" ]
                                (row
                                    |> List.drop (firstCol - 1)
                                    |> List.take 5
                                    |> List.map
                                        (\col ->
                                            div [ class ("col " ++ col) ] []
                                        )
                                )
                        )
                )
            ]
