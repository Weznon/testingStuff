import Data.Char as Char

data Instruction = Instruction Turn Degree
  deriving (Show, Eq)
data Turn = R | L
instance Show Turn where
  show R = "R"
  show L = "L"

instance Eq Turn where
  R == R = True
  L == L = True
  _ == _ = False

type Degree = Int

rawIConvert :: String -> [String]
rawIConvert = remCommas . remSpaces

remCommas :: String -> [String]
remCommas s = case dropWhile (==',') s of
               "" -> []
               s' -> w : remCommas s''
                  where (w, s'') = break (==',') s'

remSpaces :: String -> String
remSpaces = filter (/=' ')

parseComplete :: String -> [Instruction]
parseComplete x = map parseInstruction mx
                    where mx = rawIConvert x

parseInstruction :: String -> Instruction
parseInstruction ('R':x) = (Instruction R (read x))
parseInstruction ('L':x) = (Instruction L (read x))
parseInstruction _ = (Instruction R 0)

newPos :: (Int, Int) -> [Instruction] -> (Int, Int)
newPos (x, y) x:xs =

main :: IO()
main = print "hi"
