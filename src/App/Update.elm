module App.Update exposing (..)

import App.Model exposing (..)
import App.Msg exposing (..)
import Hero
import Camera
import Keypress


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick time ->
            tick msg model

        Motion _ ->
            motion msg model

        KeyDown _ ->
            updateKeypress msg model

        KeyUp _ ->
            updateKeypress msg model

        _ ->
            ( model, Cmd.none )


tick : Msg -> Model -> ( Model, Cmd Msg )
tick msg model =
    ( { model
        | hero = Hero.update msg model.keypress model.hero
        , camera = Camera.update msg model.keypress model.camera
      }
    , Cmd.none
    )


motion : Msg -> Model -> ( Model, Cmd Msg )
motion msg model =
    ( { model | hero = Hero.update msg model.keypress model.hero }, Cmd.none )


updateKeypress : Msg -> Model -> ( Model, Cmd Msg )
updateKeypress msg model =
    ( { model | keypress = Keypress.update msg model.keypress }, Cmd.none )
