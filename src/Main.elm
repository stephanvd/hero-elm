module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as Html
import Keyboard
import Hero
import World


-- APP


main : Program Never
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


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



-- UPDATE


type Msg
    = NoOp
    | KeyPress Keyboard.KeyCode


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        KeyPress keyCode ->
            ( { model
                | hero = (Hero.update (Hero.KeyPress keyCode) model.hero)
                , world = (World.update (World.KeyPress keyCode) model.world)
              }
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Keyboard.presses KeyPress
        ]



-- VIEW


view : Model -> Html a
view model =
    div [ class "container" ]
        [ World.view model.world
        , Hero.view model.hero
        , div [ class "debug-model" ] [ text (toString model) ]
        ]
