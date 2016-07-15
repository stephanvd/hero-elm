module App.Subscriptions exposing (..)

import Time
import Keyboard
import App.Model exposing (..)
import App.Msg exposing (..)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Time.every (Time.millisecond * 16.67) Tick
        , Time.every (Time.millisecond * 200) Motion
        , Keyboard.downs KeyDown
        , Keyboard.ups KeyUp
        ]
