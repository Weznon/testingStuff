--Stats
type STR = Int
type INT = Int
type WIS = Int
type DEX = Int
type CON = Int
type CHA = Int
--For easier stat stuff
data StatTable = StatTable STR INT WIS DEX CON CHA
                deriving (Show, Eq)

--Jobs
data Job =  Blacksmith

type
data Person =   Adult StatTable
                Child StatTable
