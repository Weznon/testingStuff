module WorkSim where

import Defines
import Helper

--Gets total amount of labour a worker produces
labourTotal :: StatTable -> Int
labourTotal (StatTable str int _ _ con _)       = (str + con + int) `div` 3

--Takes a work table, labour, and returns whether or not the item is finished or not
isComplete :: WorkTable -> Int -> Bool
isComplete inputWT inputI       = snd itemToCheck <= inputI
                                where itemToCheck       = head inputWT



--Changes to Statuses, Inventory, and Work Table
--simulateWork :: Person -> Person
