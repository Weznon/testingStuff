sumN :: (Num a, Enum a) => a -> a
sumN x = sum [1..x]


main :: IO ()
main = do putStrLn " Enter a number"
          a <- getLine
          putStrLn ("Sum from 1 to " ++ a ++ " is:")
          print $ sumN (read a :: Integer)
