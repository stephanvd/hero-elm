module Hero exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import App.Msg exposing (..)
import Keypress


-- UTILS


constants : { width : Int, height : Int }
constants =
    { width = 32, height = 52 }


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
    = Standing
    | Moving
    | Dead


type alias Model =
    { direction : Direction
    , status : Status
    , stepLeft : Bool
    }


init : Model
init =
    { direction = North, status = Standing, stepLeft = False }



-- UPDATE


update : Msg -> Keypress.Model -> Model -> Model
update msg keys model =
    model
        |> (updateStatus keys)
        |> (alternateStep msg keys)
        |> (updateMovement keys)


updateStatus : Keypress.Model -> Model -> Model
updateStatus keys model =
    let
        movementKeys =
            [ MoveLeft, MoveUp, MoveRight, MoveDown ]

        isMoving =
            keys |> List.any (\x -> List.member x movementKeys)
    in
        if isMoving then
            { model | status = Moving }
        else
            { model | status = Standing }


updateMovement : Keypress.Model -> Model -> Model
updateMovement keys model =
    model
        |> (moveLeft keys)
        |> (moveUp keys)
        |> (moveRight keys)
        |> (moveDown keys)


alternateStep : Msg -> Keypress.Model -> Model -> Model
alternateStep msg keys model =
    case msg of
        Motion time ->
            { model | stepLeft = (not model.stepLeft) }

        _ ->
            model


moveLeft : Keypress.Model -> Model -> Model
moveLeft keys model =
    if List.member MoveLeft keys then
        { model | direction = West }
    else
        model


moveUp : Keypress.Model -> Model -> Model
moveUp keys model =
    if List.member MoveUp keys then
        { model | direction = North }
    else
        model


moveRight : Keypress.Model -> Model -> Model
moveRight keys model =
    if List.member MoveRight keys then
        { model | direction = East }
    else
        model


moveDown : Keypress.Model -> Model -> Model
moveDown keys model =
    if List.member MoveDown keys then
        { model | direction = South }
    else
        model



-- VIEW


view : Model -> Html a
view model =
    div [ class "hero" ]
        [ img
            [ src "/img/hero.png"
            , class (directionClass model ++ " " ++ motionClass model)
            ]
            []
        ]


directionClass : Model -> String
directionClass model =
    "facing" ++ toString model.direction


motionClass : Model -> String
motionClass model =
    if model.status == Moving then
        " alternate" ++ toString model.stepLeft
    else
        ""
