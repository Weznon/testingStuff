import Data.Char

data Instruction = Instruction Char Int

charToValue :: Char -> Int
charToValue 'a' = 1
charToValue 'b' = 2
charToValue 'c' = 3
charToValue 'd' = 4
charToValue 'e' = 5
charToValue 'f' = 6
charToValue 'g' = 7
charToValue 'h' = 8
charToValue 'i' = 9
charToValue 'j' = 10
charToValue 'k' = 11
charToValue 'l' = 12
charToValue 'm' = 13
charToValue 'n' = 14
charToValue 'o' = 15
charToValue 'p' = 16
charToValue 'q' = 17
charToValue 'r' = 18
charToValue 's' = 19
charToValue 't' = 20
charToValue 'u' = 21
charToValue 'v' = 22
charToValue 'w' = 23
charToValue 'x' = 24
charToValue 'y' = 25
charToValue 'z' = 26
charToValue  x  = 0

iOne :: Int -> Int
iOne = (*) 2

iTwo :: Int -> Int
iTwo x = (x `mod` 3) * 5

iThr :: Int -> Int
iThr x = (x `div` 4) * (-8)

--iFou :: Int -> Int
iFou x = floor (sqrt x)
--iFiv :: Int -> Int
