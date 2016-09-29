module ItemDef where

data ItemWeapon = Dagger
                | Sword
                deriving (Show, Eq, Read)

data ItemFood   = Bread
                | Apple
                deriving (Show, Eq, Read)

data Item       = ItemFood
                | ItemWeapon
                | ItemGood


type WorkTable  = [(Item, Int)]
