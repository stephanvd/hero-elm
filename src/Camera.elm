module Camera exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import App.Msg exposing (..)
import Map.View as Map
import Map.Model
import Keypress
import Hero
import Tile
import Array


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
            (model.x > 0)
                && (List.member MoveLeft keys)
                && not (detectLeftCollision model)
    in
        if move then
            { model | x = model.x - constants.speed }
        else
            model


moveUp : Keypress.Model -> Model -> Model
moveUp keys model =
    let
        move =
            (model.y > 0)
                && (List.member MoveUp keys)
                && not (detectTopCollision model)
    in
        if move then
            { model | y = model.y - constants.speed }
        else
            model


moveRight : Keypress.Model -> Model -> Model
moveRight keys model =
    let
        move =
            (model.x < Map.Model.width - (.width Hero.constants))
                && (List.member MoveRight keys)
                && not (detectRightCollision model)
    in
        if move then
            { model | x = model.x + constants.speed }
        else
            model


moveDown : Keypress.Model -> Model -> Model
moveDown keys model =
    let
        move =
            (model.y < Map.Model.height - (.height Hero.constants))
                && (List.member MoveDown keys)
                && not (detectBottomCollision model)
    in
        if move then
            { model | y = model.y + constants.speed }
        else
            model


detectLeftCollision : Model -> Bool
detectLeftCollision model =
    Tile.isSolid (pinpointTile (heroXStart model) (heroYStart model))
        || Tile.isSolid (pinpointTile (heroXStart model) (heroYEnd model))


detectRightCollision : Model -> Bool
detectRightCollision model =
    Tile.isSolid (pinpointTile (heroXEnd model) (heroYStart model))
        || Tile.isSolid (pinpointTile (heroXEnd model) (heroYEnd model))


detectTopCollision : Model -> Bool
detectTopCollision model =
    Tile.isSolid (pinpointTile (heroXStart model) (heroYStart model))
        || Tile.isSolid (pinpointTile (heroXEnd model) (heroYStart model))


detectBottomCollision : Model -> Bool
detectBottomCollision model =
    Tile.isSolid (pinpointTile (heroXStart model) (heroYEnd model))
        || Tile.isSolid (pinpointTile (heroXEnd model) (heroYEnd model))


heroXStart model =
    model.x - 1


heroXEnd model =
    model.x + (.width Hero.constants) + 1


heroYStart model =
    model.y - 1


heroYEnd model =
    model.y + (.height Hero.constants)


pinpointTile : Int -> Int -> Tile.Kind
pinpointTile x y =
    let
        yCount =
            y // 64

        row =
            Array.get yCount (Array.fromList Map.Model.layer0)

        xCount =
            x // 64

        tile =
            Array.get xCount
                (row
                    |> Maybe.withDefault []
                    |> Array.fromList
                )
    in
        tile |> Maybe.withDefault Tile.Grass


view : Model -> Hero.Model -> Html a
view model hero =
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
            [ Map.view mapX mapY hero
            ]