{-# OPTIONS_GHC -Wall #-}
module HW02 where
import Data.List
-- Mastermind -----------------------------------------

-- A peg can be one of six colors
data Peg = Red | Green | Blue | Yellow | Orange | Purple
         deriving (Show, Eq, Ord)

-- A code is defined to simply be a list of Pegs
type Code = [Peg]

-- A move is constructed using a Code and two integers; the number of
-- exact matches and the number of regular matches
data Move = Move Code Int Int
          deriving (Show, Eq)

-- List containing all of the different Pegs
colors :: [Peg]
colors = [Red, Green, Blue, Yellow, Orange, Purple]

idek :: Code
idek = [Red, Green, Green, Blue]

idek2 :: Code
idek2 = [Red, Green, Blue, Yellow]
-- Exercise 1 -----------------------------------------

-- Get the number of exact matches between the actual code and the guess
exactMatches :: Code -> Code -> Int
exactMatches x y = length (filter (\(peg1, peg2) -> peg1 == peg2) (zip x y))

-- Exercise 2 -----------------------------------------
-- For each peg in xs, count how many times is occurs in ys
countColors :: Code -> [Int]
countColors x = [length . filter (== Red) $ x, length . filter (== Green) $ x, length . filter (== Blue) $ x, length . filter (== Yellow) $ x, length . filter (== Orange) $ x, length . filter (== Purple) $ x]

-- Count number of matches between the actual code and the guess
matches :: Code -> Code -> Int
matches x y = sum (map (\(count1, count2) -> if (count1 > count2) then count2 else count1) (zip (countColors x) (countColors y)))

-- Exercise 3 -----------------------------------------

-- Construct a Move from a guess given the actual code
getMove :: Code -> Code -> Move
getMove x y = Move y (exactMatches x y) (matches x y - exactMatches x y)

-- Exercise 4 -----------------------------------------

isConsistent :: Move -> Code -> Bool
isConsistent (Move x y z) w = y == (exactMatches x w) && z == (matches x w - exactMatches x w)

-- Exercise 5 -----------------------------------------

filterCodes :: Move -> [Code] -> [Code]
filterCodes x y = filter (\z -> isConsistent x z) y

-- Exercise 6 -----------------------------------------

allCodes :: Int -> [Code]
allCodes 1 = [[Red], [Green], [Blue], [Yellow], [Orange], [Purple]]
allCodes x = concatMap (\z -> [z ++ [Red], z ++ [Green], z ++ [Blue], z ++ [Yellow], z ++ [Orange], z ++ [Purple]]) (allCodes (x-1))

-- Exercise 7 -----------------------------------------

solve :: Code -> [Move]
solve = undefined

-- Bonus ----------------------------------------------

fiveGuess :: Code -> [Move]
fiveGuess = undefined
