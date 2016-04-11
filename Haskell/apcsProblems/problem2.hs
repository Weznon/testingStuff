countOfElem :: (Eq a) => a -> [a] -> Int
countOfElem y list = length $ filter (== y) list

main :: IO()
main = do
          putStrLn "Type the String: "
          a <- getLine
          putStrLn "Type the Character: "
          b <- getChar
          print $ countOfElem b a
