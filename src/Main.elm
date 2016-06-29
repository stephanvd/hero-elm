module Main exposing (..)

import Html.App as Html
import App.Model exposing (init)
import App.Update exposing (update)
import App.View exposing (view)
import App.Subscriptions exposing (subscriptions)


main : Program Never
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
