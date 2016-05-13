import Data.List

parseToPrint _ [] = []
parseToPrint x xs = if x == head xs
                        then "*" ++parseToPrint x (tail xs)
                        else parseToPrint x (tail xs)

parseAll xs = unlines i[show x ++ " | " ++ parseToPrint x xs | x <- [0..9]]
