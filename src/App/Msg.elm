module App.Msg exposing (..)

import Keyboard


type Msg
    = NoOp
    | KeyPress Keyboard.KeyCode
