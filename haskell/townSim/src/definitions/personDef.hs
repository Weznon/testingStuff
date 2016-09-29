module PersonDef where
    import      ItemDef
--Definition of a person
data Person     = Adult Name Age Job StatTable Statuses WorkTable
                | Child Name Age StatTable Statuses
                deriving (Show, Eq, Read)

--Simple type synonyms, to make it easier to read functions
type Age        = Int
type Name       = String

--Easier way to represent stats, makes it easier to read
data StatTable  = StatTable STR INT WIS DEX CON CHA
                deriving (Show, Eq, Read)

--Simple type synonyms, to make it easier to read functions
type STR        = Int
type INT        = Int
type WIS        = Int
type DEX        = Int
type CON        = Int
type CHA        = Int


--Jobs. Used to determine day to day activity
data Job        = Blacksmith
                | Guard
                | Engineer
                | Farmer
                | Worker
                | Weaver
                | Mason
                | Carpenter
                | Hunter
                deriving (Show, Eq, Read)

--Statuses. Used to represent what happened during the day, provides debuffs and buffs
data Status     = Wounded
                | Sickly
                | Inspired
                | Tired
                | Drunk
                deriving (Show, Eq, Read)

--Since Statuses can be a lot, it's best to do it this way as opposed to a a
type Statuses   = [Status]
