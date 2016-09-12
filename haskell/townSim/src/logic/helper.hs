module Helper where

import Defines

getStat :: StatTable -> Int -> Int
getStat (StatTable str int wis dex con cha) 1     = str
getStat (StatTable str int wis dex con cha) 2     = int
getStat (StatTable str int wis dex con cha) 3     = wis
getStat (StatTable str int wis dex con cha) 4     = dex
getStat (StatTable str int wis dex con cha) 5     = con
getStat (StatTable str int wis dex con cha) 6     = cha
