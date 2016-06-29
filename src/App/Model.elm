module App.Model exposing (..)

import App.Msg exposing (Msg)
import Hero
import World


type alias Model =
    { hero : Hero.Model
    , world : World.Model
    }


init : ( Model, Cmd Msg )
init =
    ( { hero = Hero.init
      , world = World.init
      }
    , Cmd.none
    )
