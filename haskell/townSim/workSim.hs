module WorkSim where

import Defines
import Helper

--Should only be run on adults, children have no work to do. They just might get hurt
labourTotal :: StatTable -> Int
labourTotal (StatTable str int _ _ con _)       = (str + con + int) `div` 3






--Changes to Statuses, Inventory, and Work Table
--simulateWork :: Person -> Person
