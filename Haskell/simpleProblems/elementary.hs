--Problem 1
problem1 :: IO ()
problem1 = putStrLn "Hello World"
--Problem 2
problem2 :: IO ()
problem2 = do putStrLn " What is your name?"
              name <- getLine
              putStrLn  ("Hello " ++ name ++ "!")
--Problem 3
problem3 :: IO ()
problem3 = do putStrLn " What is your name?"
              name <- getLine
              if name == "Alice" || name == "Bob" || name == "alice" || name == "bob"
              then putStrLn  ("Hello " ++ name ++ "!")
              else putStrLn "Hello!"
--Problem 4/5
prompt :: String -> IO String
prompt x = do putStrLn x
              getLine

main :: IO ()
main = do putStrLn "Problem 1"
          problem1
          putStrLn "Problem 2"
          problem2
          putStrLn "Problem 3"
          problem3
          putStrLn "Problem 4"
          do  number <- prompt "Input a number: "
              print $ sum[1..(read number :: Int)]
          putStrLn " Problem 5"
          do  numboid <- prompt "Input a Number: "
              print $ sum [x | x <- [1..(read numboid :: Int)], (x `mod` 3) == 0 || (x `mod` 5) == 0]
