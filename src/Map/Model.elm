module Map.Model exposing (..)


type alias Position =
    { x : Int
    , y : Int
    }


type alias Tile =
    String


type alias Grid =
    List (List Tile)


type alias Model =
    { grid : Grid
    , center : Position
    }


g : Tile
g =
    "grass"


w : Tile
w =
    "water"


r : Tile
r =
    "rock"


init : Model
init =
    { grid =
        [ [ g, g, g, r, g, g, g, g, w, w, w, g, g, g ]
        , [ g, g, g, r, g, g, g, w, w, w, w, w, g, g ]
        , [ g, w, g, g, g, g, g, w, w, w, w, w, w, g ]
        , [ w, w, g, g, g, g, g, g, g, g, g, g, g, r ]
        , [ w, w, w, g, g, r, r, w, w, w, g, r, r, r ]
        , [ w, w, w, g, g, r, r, w, w, w, g, r, r, r ]
        , [ w, w, g, g, g, g, g, w, w, g, g, g, g, r ]
        ]
    , center = { x = 3, y = 3 }
    }
