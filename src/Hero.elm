module Hero exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Keyboard exposing (KeyCode)
import Char exposing (fromCode)


-- MODEL


type Direction
    = North
    | East
    | South
    | West


type alias Model =
    { direction : Direction }


init : Model
init =
    { direction = North }



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
            case fromCode keyCode of
                'w' ->
                    { model | direction = North }

                'a' ->
                    { model | direction = West }

                's' ->
                    { model | direction = South }

                'd' ->
                    { model | direction = East }

                _ ->
                    model



-- VIEW


view : Model -> Html a
view model =
    div [ class ("hero " ++ directionClass model.direction) ]
        [ text "☺" ]


directionClass : Direction -> String
directionClass direction =
    case direction of
        North ->
            "northFacing"

        East ->
            "eastFacing"

        South ->
            "southFacing"

        West ->
            "westFacing"
