module Defines where

--Some simple type synonyms, to make it easier to read functions
type STR        = Int
type INT        = Int
type WIS        = Int
type DEX        = Int
type CON        = Int
type CHA        = Int
type Age        = Int
type Name       = String

--Easier way to represent stats, makes it easier to read
data StatTable  = StatTable STR INT WIS DEX CON CHA
                deriving (Show, Eq, Read)

--Jobs. Used to determine day to day activity
data Job        = Blacksmith
                | Merchant
                | Guard
                deriving (Show, Eq, Read)
--idk need more
--Statuses. Used to represent what happened during the day, provides debuffs and buffs
data Status     = Wounded
                | Sickly
                deriving (Show, Eq, Read)

--Since Statuses can be a lot, it's best to do it this way as opposed to a a
type Statuses   = [Status]

data Item       = Dagger
                | Sword
                deriving (Show, Eq, Read)

type Inventory  = [Item]

type WorkTable  = [(Item, Int)]

data Person     = Adult Name Age Job StatTable Statuses Inventory --WorkTable
                | Child Name Age StatTable Statuses
                deriving (Show, Eq, Read)

type Population = [Person]
