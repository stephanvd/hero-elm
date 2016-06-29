module App.Update exposing (..)

import App.Model exposing (..)
import App.Msg exposing (..)
import Hero
import World


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        KeyPress keyCode ->
            ( { model
                | hero = (Hero.update (Hero.KeyPress keyCode) model.hero)
                , world = (World.update (World.KeyPress keyCode) model.world)
              }
            , Cmd.none
            )
