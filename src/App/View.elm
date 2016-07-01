module App.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import App.Model exposing (..)
import Map.View
import Hero


view : Model -> Html a
view model =
    div [ class "container" ]
        [ -- div [ class "debug-model" ] [ text (toString model) ]
          --,
          Map.View.view model.map
          -- , Hero.view model.hero
        ]
