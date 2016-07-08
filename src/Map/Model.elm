module Map.Model exposing (..)

import Tile


type alias Model =
    List (List Tile.Kind)



-- Layer 0


g : Tile.Kind
g =
    Tile.Grass


m : Tile.Kind
m =
    Tile.Mud


t : Tile.Kind
t =
    Tile.Tree



-- Layer 1


b : Tile.Kind
b =
    Tile.Bush


o : Tile.Kind
o =
    Tile.TreeTop


x : Tile.Kind
x =
    Tile.Empty



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


gameObjects : Model
gameObjects =
    [ [ t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t ]
    , []
    , [ b, b, o ]
    , [ x, x, t ]
    ]



-- Util


height =
    64 * (List.length groundLayer)


width =
    64
        * ((List.head groundLayer)
            |> Maybe.withDefault []
            |> List.length
          )
