module App.Model exposing (..)

import App.Msg exposing (Msg)
import Hero
import Map.Model as Map
import Keypress


type alias Model =
    { hero : Hero.Model
    , map : Map.Model
    , keypress : Keypress.Model
    }


init : ( Model, Cmd Msg )
init =
    ( { hero = Hero.init
      , map = Map.init
      , keypress = Keypress.init
      }
    , Cmd.none
    )
