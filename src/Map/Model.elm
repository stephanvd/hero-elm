module Map.Model exposing (..)

import Tile
import GameObject
import Dict exposing (Dict)


type alias Model =
    List (List Tile.Kind)


type alias SpatialHash =
    Dict ( Int, Int ) (List GameObject.Kind)



-- Ground tiles


g : Tile.Kind
g =
    Tile.Grass


m : Tile.Kind
m =
    Tile.Mud



-- Game objects


t : GameObject.Kind
t =
    GameObject.Tree


b : GameObject.Kind
b =
    GameObject.Bush


o : GameObject.Kind
o =
    GameObject.TreeTop


x : GameObject.Kind
x =
    GameObject.Empty



-- Init


groundLayer : Model
groundLayer =
    [ [ g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g ]
    , [ g, m, g, g, g, g, g, g, m, g, g, g, g, g, g, m, g, g, g, g, g, g, m, g, g, g, g, g, g ]
    , [ g, g, g, g, g, m, m, g, g, g, g, g, m, m, g, g, g, g, g, m, m, g, g, g, g, g, m, m, m ]
    , [ g, g, g, m, m, m, m, g, g, g, m, m, m, m, g, g, g, m, m, m, m, g, g, g, m, m, m, m, m ]
    , [ g, g, g, m, g, g, m, g, g, g, m, g, g, m, g, g, g, m, g, g, m, g, g, g, m, g, g, m, m ]
    , [ g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g ]
    , [ g, m, g, g, g, g, g, g, m, g, g, g, g, g, g, m, g, g, g, g, g, g, m, g, g, g, g, g, g ]
    , [ g, m, m, g, g, g, g, g, m, m, g, g, g, g, g, m, m, g, g, g, g, g, m, m, g, g, g, g, g ]
    , [ g, m, g, g, g, g, g, g, m, g, g, g, g, g, g, m, g, g, g, g, g, g, m, g, g, g, g, g, g ]
    , [ g, g, g, g, g, m, m, g, g, g, g, g, m, m, g, g, g, g, g, m, m, g, g, g, g, g, m, m, m ]
    , [ g, g, g, m, m, m, m, g, g, g, m, m, m, m, g, g, g, m, m, m, m, g, g, g, m, m, m, m, m ]
    , [ g, g, g, m, g, g, m, g, g, g, m, g, g, m, g, g, g, m, g, g, m, g, g, g, m, g, g, m, m ]
    , [ g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g ]
    , [ g, m, g, g, g, g, g, g, m, g, g, g, g, g, g, m, g, g, g, g, g, g, m, g, g, g, g, g, g ]
    , [ g, m, m, g, g, g, g, g, m, m, g, g, g, g, g, m, m, g, g, g, g, g, m, m, g, g, g, g, g ]
    , [ g, m, g, g, g, g, g, g, m, g, g, g, g, g, g, m, g, g, g, g, g, g, m, g, g, g, g, g, g ]
    , [ g, g, g, g, g, m, m, g, g, g, g, g, m, m, g, g, g, g, g, m, m, g, g, g, g, g, m, m, m ]
    , [ g, g, g, m, m, m, m, g, g, g, m, m, m, m, g, g, g, m, m, m, m, g, g, g, m, m, m, m, m ]
    , [ g, g, g, m, g, g, m, g, g, g, m, g, g, m, g, g, g, m, g, g, m, g, g, g, m, g, g, m, m ]
    , [ g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g, g ]
    , [ g, m, g, g, g, g, g, g, m, g, g, g, g, g, g, m, g, g, g, g, g, g, m, g, g, g, g, g, g ]
    , [ g, m, m, g, g, g, g, g, m, m, g, g, g, g, g, m, m, g, g, g, g, g, m, m, g, g, g, g, g ]
    ]


gameObjects : SpatialHash
gameObjects =
    [ [ t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t ]
    , []
    , [ b, b, o ]
    , [ x, x, t ]
    ]
        |> spatialHash


spatialHash : List (List GameObject.Kind) -> SpatialHash
spatialHash gameObjects =
    gameObjects
        |> List.indexedMap (\y r -> r |> List.indexedMap (\x c -> ( ( x, y ), c )))
        |> List.concat
        |> List.foldl toHash Dict.empty


toHash : ( ( Int, Int ), GameObject.Kind ) -> SpatialHash -> SpatialHash
toHash ( key, elem ) acc =
    Dict.update key (\v -> Just (elem :: Maybe.withDefault [] v)) acc


height =
    64 * (List.length groundLayer)


width =
    64
        * ((List.head groundLayer)
            |> Maybe.withDefault []
            |> List.length
          )
