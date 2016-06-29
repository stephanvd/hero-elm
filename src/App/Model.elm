module App.Model exposing (..)

import App.Msg exposing (Msg)
import Hero
import Map.Model as Map


type alias Model =
    { hero : Hero.Model
    , map : Map.Model
    }


init : ( Model, Cmd Msg )
init =
    ( { hero = Hero.init
      , map = Map.init
      }
    , Cmd.none
    )
