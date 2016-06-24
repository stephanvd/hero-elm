module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App as Html
import Html.Events exposing (onClick)
import Keyboard
import Hero


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
    { counter : Int
    , hero : Hero.Model
    }


init : ( Model, Cmd Msg )
init =
    ( { counter = 0
      , hero = Hero.init
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = NoOp
    | Increment
    | KeyPress Keyboard.KeyCode


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        KeyPress keyCode ->
            ( { model | hero = (Hero.update (Hero.KeyPress keyCode) model.hero) }, Cmd.none )

        Increment ->
            ( { model | counter = model.counter + 1 }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Keyboard.presses KeyPress
        ]



-- VIEW


view : Model -> Html Msg
view model =
    Hero.view model.hero
