module App.Msg exposing (..)

import Keyboard
import Time


type Msg
    = NoOp
    | KeyDown Keyboard.KeyCode
    | KeyUp Keyboard.KeyCode
    | Tick Time.Time
    | MoveUp
    | MoveDown
    | MoveLeft
    | MoveRight
