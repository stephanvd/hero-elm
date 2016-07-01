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



-- Init


layer0 : Model
layer0 =
    [ [ t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t, t ]
    , [ g, m, g, g, g, g, g, g, m, g, g, g, g, g, g, m, g, g, g, g, g, g, m, g, g, g, g, g, g ]
    , [ g, g, g, g, g, m, m, g, g, g, g, g, m, m, g, g, g, g, g, m, m, g, g, g, g, g, m, m, m ]
    , [ g, g, t, m, m, m, m, g, g, g, m, m, m, m, g, g, g, m, m, m, m, g, g, g, m, m, m, m, m ]
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


layer1 : Model
layer1 =
    [ []
    , []
    , [ b, b, o ]
    ]
