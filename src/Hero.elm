module Hero exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Keyboard
import Char


-- MODEL


type Direction
    = North
    | East
    | South
    | West


type Status
    = Living
    | Dead


type alias Model =
    { direction : Direction
    , status : Status
    }


init : Model
init =
    { direction = North, status = Living }



-- UPDATE


type Msg
    = NoOp
    | KeyPress Keyboard.KeyCode
    | Dies


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model

        KeyPress keyCode ->
            case Char.fromCode keyCode of
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

        Dies ->
            { model | status = Dead }



-- VIEW


view : Model -> Html a
view model =
    div [ class ("hero facing" ++ toString model.direction) ]
        [ text "☺" ]
