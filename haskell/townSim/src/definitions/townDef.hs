module TownDef where
    import      PersonDef
    import      ItemDef

--Buildings
data Building   = Workshop
                | Farm
                | Forge
                | GuardTower


type Stockpile  = [Item]

type Population = [Person]
