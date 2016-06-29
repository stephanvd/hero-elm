module App.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import App.Model exposing (..)
import World
import Hero


view : Model -> Html a
view model =
    div [ class "container" ]
        [ World.view model.world
        , Hero.view model.hero
        , div [ class "debug-model" ] [ text (toString model) ]
        ]
