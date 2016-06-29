module Map.Update exposing (..)

import Char
import Map.Model exposing (..)
import App.Msg exposing (..)


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
                case Char.fromCode keyCode of
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
