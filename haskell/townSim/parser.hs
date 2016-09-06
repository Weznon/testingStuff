module Parser where

import Defines

--Like words, but with commas
breaker :: String -> [String]
breaker [] = []
breaker xxs@(x:xs)
        |x == ',' = breaker xs
        |otherwise = ys : breaker rest
                where (ys, rest) = break (== ',') xxs

--Takes a string of stats, turns it into StatTable
parseStats :: String -> StatTable
parseStats inputS = StatTable (read (b !! 0)) (read (b !! 1)) (read (b !! 2)) (read (b !! 3)) (read (b !! 4)) (read (b !! 5))
                where b = words inputS

{- Takes an Input such as
"Bobby Tables the God, 18, 5 5 5 5 5 5, Wounded1"
and turns it into a Person data
-}
parsePerson :: String -> Person
parsePerson inputS = Person
