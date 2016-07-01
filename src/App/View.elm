module App.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import App.Model exposing (..)
import Camera
import Hero


view : Model -> Html a
view model =
    div []
        [ div [ class "debug-model" ] [ text (toString model) ]
        , Camera.view model.camera model.hero
        ]
