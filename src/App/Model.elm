module App.Model exposing (..)

import App.Msg exposing (Msg)
import Hero
import Map.Model


type alias Model =
    { hero : Hero.Model
    , map : Map.Model.Model
    }


init : ( Model, Cmd Msg )
init =
    ( { hero = Hero.init
      , map = Map.Model.init
      }
    , Cmd.none
    )
