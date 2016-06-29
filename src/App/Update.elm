module App.Update exposing (..)

import App.Model exposing (..)
import App.Msg exposing (..)
import Hero
import Map.Update as Map


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        KeyPress keyCode ->
            ( { model
                | hero = (Hero.update (Hero.KeyPress keyCode) model.hero)
                , map = (Map.update (KeyPress keyCode) model.map)
              }
            , Cmd.none
            )
