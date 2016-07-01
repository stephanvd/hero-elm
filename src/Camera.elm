module Camera exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import App.Msg exposing (..)
import Map.View as Map
import Keypress


constants : { width : Int, height : Int, speed : Int }
constants =
    { width = 512, height = 512, speed = 4 }


type alias Model =
    { x : Int
    , y : Int
    }


init : Model
init =
    { x = 0, y = 0 }


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
    if (model.x + halfWidth) < 1 then
        { model | x = -halfWidth }
    else if List.member MoveLeft keys then
        { model | x = model.x - constants.speed }
    else
        model


moveRight : Keypress.Model -> Model -> Model
moveRight keys model =
    if List.member MoveRight keys then
        { model | x = model.x + constants.speed }
    else
        model


moveUp : Keypress.Model -> Model -> Model
moveUp keys model =
    if (model.y + halfHeight) < 1 then
        { model | y = -halfHeight }
    else if List.member MoveUp keys then
        { model | y = model.y - constants.speed }
    else
        model


moveDown : Keypress.Model -> Model -> Model
moveDown keys model =
    if List.member MoveDown keys then
        { model | y = model.y + constants.speed }
    else
        model


view : Model -> Html a
view model =
    div
        [ class "camera"
        , style
            [ ( "width", toString <| constants.width )
            , ( "height", toString <| constants.height )
            ]
        ]
        [ Map.view model.x model.y ]
