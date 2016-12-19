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

newPos :: (Int, Int, Int) -> [Instruction] -> (Int, Int, Int)
newPos (d, x, y) ([]) = (d, x, y)
newPos (d, x, y) ((Instruction R z):xs) = newPos (m $ d + 1, x + (fst $ change (m $ d + 1) z), y + (snd $ change (m $ d + 1) z)) xs
newPos (d, x, y) ((Instruction L z):xs) = newPos (m $ d - 1, x + (fst (change (m $ d - 1) z)), y + (snd (change (m $ d - 1) z))) xs

subset :: [a] -> [[a]]
subset x = [[x !! z | z <- [0..(w)]] | w <- [0..(length x - 1)]]

listofpositions :: [Instruction] -> [(Int, Int, Int)]
listofpositions z = map (\x -> newPos (0, 0, 0) x) (subset z)

stripDirections :: (Int, Int, Int) -> (Int, Int)
stripDirections (x, y, z) = (y, z)

stripList :: [(Int, Int, Int)] -> [(Int, Int)]
stripList x = map stripDirections x

findDuplicates :: [(Int, Int)] -> [Int]
findDuplicates x = [if (elem (x !! z) ([x !! w | w <- [(z + 1)..(length x - 1)]])) then z else 0 | z <- [0..(length x - 1)]]

findFirst :: [Int] -> [Int]
findFirst x = filter (\x -> x /= 0) x

m :: Int -> Int
m x = x `mod` 4

answer :: (Int, Int, Int) -> Int
answer (x, y, z) = y + z
change :: Int -> Int -> (Int, Int)
change 0 x = (0, x)
change 1 x = (x, 0)
change 2 x = (0, -x)
change 3 x = (-x, 0)
change _ _ = (0, 0)


combine :: (Int, Int, Int) -> (Int, Int) -> (Int, Int, Int)
combine (x, y, z) (w, q) = (x, y + w, z + q)

input :: String
input = "L4, L1, R4, R1, R1, L3, R5, L5, L2, L3, R2, R1, L4, R5, R4, L2, R1, R3, L5, R1, L3, L2, R5, L4, L5, R1, R2, L1, R5, L3, R2, R2, L1, R5, R2, L1, L1, R2, L1, R1, L2, L2, R4, R3, R2, L3, L188, L3, R2, R54, R1, R1, L2, L4, L3, L2, R3, L1, L1, R3, R5, L1, R5, L1, L1, R2, R4, R4, L5, L4, L1, R2, R4, R5, L2, L3, R5, L5, R1, R5, L2, R4, L2, L1, R4, R3, R4, L4, R3, L4, R78, R2, L3, R188, R2, R3, L2, R2, R3, R1, R5, R1, L1, L1, R4, R2, R1, R5, L1, R4, L4, R2, R5, L2, L5, R4, L3, L2, R1, R1, L5, L4, R1, L5, L1, L5, L1, L4, L3, L5, R4, R5, R2, L5, R5, R5, R4, R2, L1, L2, R3, R5, R5, R5, L2, L1, R4, R3, R1, L4, L2, L3, R2, L3, L5, L2, L2, L1, L2, R5, L2, L2, L3, L1, R1, L4, R2, L4, R3, R5, R3, R4, R1, R5, L3, L5, L5, L3, L2, L1, R3, L4, R3, R2, L1, R3, R1, L2, R4, L3, L3, L3, L1, L2"

main :: IO()
main = print  (findFirst $ findDuplicates $ stripList $ listofpositions $ parseComplete input)

--the random list for z is from main
--map (\(x, y, z) -> y + z) [listofpositions (parseComplete input) !! z | z <- [93,121,122,124,127,128,132,147]]
--[295,297,296,292,292,295,297,291]
--doing this in ghci gave that the answer was one of those, but none of them work wtf
--looks like were gonna have a v2 of this
