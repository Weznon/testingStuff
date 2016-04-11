countOfElem elem list = length $ filter (\x -> x == elem) list

main :: IO()
main = do
          putStrLn "Type the String: "
          a <- getLine
          putStrLn "Type the String: "
          b <- getChar
          print $ countOfElem b a
