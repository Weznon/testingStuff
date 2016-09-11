module Parser where

import Defines

--Like words, but with commas
breaker :: String -> [String]
breaker []      = []
breaker xxs@(x:xs)
                |x == ',' = breaker xs
                |otherwise = ys : breaker rest
                where (ys, rest) = break (== ',') xxs

--Takes a string of stats, turns it into StatTable
parseStats :: String -> StatTable
parseStats inputS       = StatTable (read (b !! 0)) (read (b !! 1)) (read (b !! 2)) (read (b !! 3)) (read (b !! 4)) (read (b !! 5))
                        where   b = words inputS

{- Takes a string like
"Dagger 5 Sword 10 Dagger 20"
and turns it into a work table
[(Dagger, 5), (Sword, 10), (Dagger, 20)]
-}
parseWorkTable :: String -> WorkTable
parseWorkTable inputS   = toTuple (words inputS)
                        where   toTuple []      = []
                                toTuple (a:b:xs)= (read a, read b):(toTuple xs)


{- Takes an Input such as
"Bobby Tables the God, 18, Gaurd, 5 5 5 5 5 5, Wounded"
"Bobby Tables the Child, 16, 5 5 5 5 5 5, Wounded"
and turns it into a Person data
18 is the default age for adulthood. Use parsePersonAge if you want to change that
-}
parsePerson :: String -> Person
parsePerson inputS      = if (read (broken !! 1) >= 18)
                                then Adult (broken !! 0) (read (broken !! 1)) (read (broken !! 2)) (parseStats (broken !! 3)) (map read (words (broken !! 4))) (if longEn then map read (words (broken !! 5)) else [])
                                else Child (broken !! 0) (read (broken !! 1)) (parseStats (broken !! 2)) (map read (words (broken !! 3)))
                        where   broken = (breaker inputS)
                                longEn = (length broken > 5)
                                longPn = (length broken > 6)
{- Same as parsePerson, but with a changeable age limit.
Set the config to use a different number if using a different race
-}
parsePersonAge :: String -> Int -> Person
parsePersonAge inputS inputI    = if (read (broken !! 1) >= inputI)
                                        then Adult (broken !! 0) (read (broken !! 1)) (read (broken !! 2)) (parseStats (broken !! 3)) (map read (words (broken !! 4))) (map read (words (broken !! 5)))
                                        else Child (broken !! 0) (read (broken !! 1)) (parseStats (broken !! 2)) (map read (words (broken !! 3)))
                                where   broken = breaker inputS
