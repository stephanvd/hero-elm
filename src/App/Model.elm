module App.Model exposing (..)

import App.Msg exposing (Msg)
import Hero
import Camera
import Keypress


type alias Model =
    { hero : Hero.Model
    , keypress : Keypress.Model
    , camera : Camera.Model
    }


init : ( Model, Cmd Msg )
init =
    ( { hero = Hero.init
      , keypress = Keypress.init
      , camera = Camera.init
      }
    , Cmd.none
    )
