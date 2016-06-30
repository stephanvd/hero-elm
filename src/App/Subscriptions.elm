module App.Subscriptions exposing (..)

import Time
import Keyboard
import App.Model exposing (..)
import App.Msg exposing (..)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Time.every (Time.millisecond * 100) Tick
        , Keyboard.downs KeyDown
        , Keyboard.ups KeyUp
        ]
