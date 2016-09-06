module Defines where

--Stats
type STR = Int
type INT = Int
type WIS = Int
type DEX = Int
type CON = Int
type CHA = Int
type Age = Int
type Name = String
--For easier stat stuff
data StatTable = StatTable STR INT WIS DEX CON CHA
                deriving (Show, Eq)

--Jobs
data Job = Blacksmith
         | Merchant
         | Guard
--idk need more
data Status = Wounded
            | Sickly
        deriving (Show, Eq, Read)

type Statuses = [Status]

data Person = Adult Name Age StatTable Statuses
            | Child Name Age StatTable Statuses
        deriving (Show, Eq)

type Population = [Person]
