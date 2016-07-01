module Map.View exposing (..)

import Keyboard exposing (KeyCode)
import Char exposing (fromCode)
import Map.Model exposing (..)
import Tile
import Html exposing (..)
import Html.Attributes exposing (..)


g =
    Tile.Grass


m =
    Tile.Mud


init =
    [ [ g, g, g, g, g, g, g, g ]
    , [ g, m, g, g, g, g, g, g ]
    , [ g, g, g, g, g, m, m, m ]
    , [ g, g, g, m, m, m, m, m ]
    , [ g, g, g, m, g, g, m, m ]
    , [ g, g, g, g, g, g, g, g ]
    , [ g, m, g, g, g, g, g, g ]
    , [ g, m, m, g, g, g, g, g ]
    ]



-- VIEW


view : Model -> Html.Html a
view _ =
    let
        model =
            init
    in
        div [ class "map" ]
            (viewRow model)


viewRow model =
    (List.map
        (\row ->
            div [ class "row" ]
                (List.map
                    (\col ->
                        Tile.view (Tile.init col)
                    )
                    row
                )
        )
        model
    )
