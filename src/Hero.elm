module Hero exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import App.Msg exposing (..)
import Keypress


-- UTILS


constants : { width : Int, height : Int }
constants =
    { width = 64, height = 64 }


halfWidth : Int
halfWidth =
    (constants.width // 2)


halfHeight : Int
halfHeight =
    (constants.height // 2)



-- MODEL


type Direction
    = North
    | East
    | South
    | West


type Status
    = Living
    | Dead


type alias Model =
    { direction : Direction
    , status : Status
    }


init : Model
init =
    { direction = North, status = Living }



-- UPDATE


update : Msg -> Keypress.Model -> Model -> Model
update msg keys model =
    model |> (updateMovement keys)


updateMovement : Keypress.Model -> Model -> Model
updateMovement keys model =
    if List.member MoveRight keys then
        { model | direction = East }
    else if List.member MoveLeft keys then
        { model | direction = West }
    else if List.member MoveUp keys then
        { model | direction = North }
    else if List.member MoveDown keys then
        { model | direction = South }
    else
        model



-- VIEW


view : Model -> Html a
view model =
    div [ class ("hero facing" ++ toString model.direction) ]
        [ img
            [ src "/img/character.png"
            , width constants.width
            , height constants.height
            ]
            []
        ]
