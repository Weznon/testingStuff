checkTri :: (Int, Int, Int) -> Bool
checkTri (a, b, c) = (a + b > c) && (a + c > b) && (b + c > a)

collapse :: [Bool] -> Int
collapse [] = 0
collapse (x:xs)
  | x = 1 + collapse xs
  | otherwise = collapse xs

findNum :: [(Int, Int, Int)] -> Int
findNum = collapse . map (checkTri)

parseTri :: String -> (Int, Int, Int)
parseTri x = (read $ xs !! 0, read $ xs !! 1, read $ xs !! 2)
    where xs = words x

parseComplete :: String -> [(Int, Int, Int)]
parseComplete x = map (parseTri) xs
  where xs = lines x

input :: String
input = "5 5 5"

main :: IO()
main = print $ findNum $ parseComplete input
