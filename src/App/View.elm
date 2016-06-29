module App.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import App.Model exposing (..)
import Map.View
import Hero


view : Model -> Html a
view model =
    div [ class "container" ]
        [ Map.View.view model.map
        , Hero.view model.hero
        , div [ class "debug-model" ] [ text (toString model) ]
        ]
