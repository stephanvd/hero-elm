module Map.Update exposing (..)

import Map.Model exposing (..)
import App.Msg exposing (..)
import Keypress


update : Msg -> Keypress.Model -> Model -> Model
update msg keys model =
    let
        center =
            model.center
    in
        if List.member MoveRight keys then
            { model | center = { center | x = center.x + 1 } }
        else if List.member MoveLeft keys then
            { model | center = { center | x = center.x - 1 } }
        else if List.member MoveUp keys then
            { model | center = { center | y = center.y - 1 } }
        else if List.member MoveDown keys then
            { model | center = { center | y = center.y + 1 } }
        else
            model



-- KeyPress keyCode ->
--     let
--         center =
--             model.center
--     in
--         case Char.fromCode keyCode of
--             'w' ->
--                 moveUp model center
--
--             'a' ->
--                 { model | center = { center | x = center.x - 1 } }
--
--             's' ->
--                 { model | center = { center | y = center.y + 1 } }
--
--             'd' ->
--                 { model | center = { center | x = center.x + 1 } }
--
--             _ ->
--                 model
