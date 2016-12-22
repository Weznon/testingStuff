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

invert :: [(Int, Int, Int)] -> [(Int, Int, Int)]
invert [] = []
invert ((a1, b1, c1):(a2, b2, c2):(a3, b3, c3):xs) = (a1, a2, a3):(b1, b2, b3):(c1, c2, c3):(invert xs)

input :: String
input = "5 5 5"

main :: IO()
main = do
  xs <- readFile "input"
  print $ findNum $ invert $ parseComplete xs
