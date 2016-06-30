module Keypress exposing (..)

import Keyboard exposing (KeyCode)
import App.Msg exposing (..)


-- MODEL


type alias Model =
    List Msg


init : Model
init =
    []



-- UPDATE


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model

        KeyDown key ->
            updateKeyDown key model

        KeyUp key ->
            updateKeyUp key model

        _ ->
            model


updateKeyDown : KeyCode -> Model -> Model
updateKeyDown key model =
    let
        keyMsg =
            (keyIntent key)
    in
        if List.member keyMsg model then
            model
        else
            keyMsg :: model


updateKeyUp : KeyCode -> Model -> Model
updateKeyUp key model =
    let
        keyMsg =
            (keyIntent key)
    in
        List.filter (\x -> not (x == keyMsg)) model


keyIntent : KeyCode -> Msg
keyIntent keyCode =
    case keyCode of
        68 ->
            MoveRight

        65 ->
            MoveLeft

        87 ->
            MoveUp

        83 ->
            MoveDown

        _ ->
            NoOp
