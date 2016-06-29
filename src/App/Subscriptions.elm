module App.Subscriptions exposing (..)

import Keyboard
import App.Model exposing (..)
import App.Msg exposing (..)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Keyboard.presses KeyPress
        ]
