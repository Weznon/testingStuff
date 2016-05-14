import Data.List


parseToPrint _ [] = []
parseToPrint x xs = if x == (head xs)
                        then "*":(parseToPrint x (tail xs))
                        else " ":parseToPrint x (tail xs)
