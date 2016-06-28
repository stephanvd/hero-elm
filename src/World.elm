module World exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Keyboard exposing (KeyCode)
import Char exposing (fromCode)


-- MODEL


type alias Position =
    { x : Int
    , y : Int
    }


type alias Tile =
    String


type alias Grid =
    List (List Tile)


type alias Model =
    { grid : Grid
    , center : Position
    }


g : Tile
g =
    "grass"


w : Tile
w =
    "water"


r : Tile
r =
    "rock"


init : Model
init =
    { grid =
        [ [ g, g, g, r, g, g, g, g, w, w, w, g, g, g ]
        , [ g, g, g, r, g, g, g, w, w, w, w, w, g, g ]
        , [ g, w, g, g, g, g, g, w, w, w, w, w, w, g ]
        , [ w, w, g, g, g, g, g, g, g, g, g, g, g, r ]
        , [ w, w, w, g, g, r, r, w, w, w, g, r, r, r ]
        , [ w, w, w, g, g, r, r, w, w, w, g, r, r, r ]
        , [ w, w, g, g, g, g, g, w, w, g, g, g, g, r ]
        ]
    , center = { x = 3, y = 3 }
    }



-- UPDATE


type Msg
    = NoOp
    | KeyPress KeyCode


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model

        KeyPress keyCode ->
            let
                center =
                    model.center
            in
                case fromCode keyCode of
                    'w' ->
                        moveUp model center

                    'a' ->
                        { model | center = { center | x = center.x - 1 } }

                    's' ->
                        { model | center = { center | y = center.y + 1 } }

                    'd' ->
                        { model | center = { center | x = center.x + 1 } }

                    _ ->
                        model


moveUp : Model -> Position -> Model
moveUp model center =
    { model | center = { center | y = center.y - 1 } }



-- VIEW


view : Model -> Html a
view model =
    let
        firstRow =
            model.center.y - 2

        firstCol =
            model.center.x - 2
    in
        div [ class "world" ]
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
