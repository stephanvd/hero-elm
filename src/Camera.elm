module Camera exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import App.Msg exposing (..)
import Map.View as Map
import Map.Model
import Keypress
import Hero


constants : { width : Int, height : Int, speed : Int }
constants =
    { width = 512, height = 512, speed = 4 }


type alias Model =
    { x : Int
    , y : Int
    }


init : Model
init =
    { x = halfWidth, y = halfHeight }


update : Msg -> Keypress.Model -> Model -> Model
update msg keys model =
    model
        |> moveLeft keys
        |> moveRight keys
        |> moveUp keys
        |> moveDown keys


halfWidth : Int
halfWidth =
    (constants.width // 2)


halfHeight : Int
halfHeight =
    (constants.height // 2)


moveLeft : Keypress.Model -> Model -> Model
moveLeft keys model =
    let
        move =
            (model.x > 0) && (List.member MoveLeft keys)
    in
        if move then
            { model | x = model.x - constants.speed }
        else
            model


moveUp : Keypress.Model -> Model -> Model
moveUp keys model =
    let
        move =
            (model.y > 0) && (List.member MoveUp keys)
    in
        if move then
            { model | y = model.y - constants.speed }
        else
            model


moveRight : Keypress.Model -> Model -> Model
moveRight keys model =
    let
        move =
            (model.x < Map.Model.width - (.width Hero.constants)) && (List.member MoveRight keys)
    in
        if move then
            { model | x = model.x + constants.speed }
        else
            model


moveDown : Keypress.Model -> Model -> Model
moveDown keys model =
    let
        move =
            (model.y < Map.Model.height - (.height Hero.constants)) && (List.member MoveDown keys)
    in
        if move then
            { model | y = model.y + constants.speed }
        else
            model


view : Model -> Html a
view model =
    let
        mapX =
            (model.x - halfWidth + Hero.halfWidth)

        mapY =
            (model.y - halfHeight + Hero.halfHeight)
    in
        div
            [ class "camera"
            , style
                [ ( "width", toString <| constants.width )
                , ( "height", toString <| constants.height )
                ]
            ]
            [ Map.view mapX mapY ]
