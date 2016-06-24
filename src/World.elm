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


g =
    "grass"


w =
    "water"


init : Model
init =
    { grid =
        [ [ g, g, g, g, w ]
        , [ g, g, g, g, g ]
        , [ g, w, g, g, g ]
        , [ w, w, g, g, g ]
        , [ w, w, w, g, g ]
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
                        { model | center = { center | x = center.y - 1 } }

                    'a' ->
                        { model | center = { center | x = center.x - 1 } }

                    's' ->
                        { model | center = { center | x = center.y + 1 } }

                    'd' ->
                        { model | center = { center | x = center.x + 1 } }

                    _ ->
                        model



-- VIEW


view : Model -> Html a
view model =
    div [ class "world" ]
        [ div []
            (List.map
                (\row ->
                    div [ class "row" ]
                        (List.map
                            (\col ->
                                div [ class ("col " ++ col) ] []
                            )
                            row
                        )
                )
                model.grid
            )
        ]
