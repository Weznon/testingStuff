main :: IO ()
main = do
          putStrLn "Enter a number: "
          a <- getLine
          putStrLn "Enter a second number: "
          b <- getLine
          let larger =  if (read a :: Int) > (read b :: Int)
                        then (read a :: Int)
                        else (read b :: Int)
          let smaller = if (read b :: Int) > (read a :: Int)
                        then (read a :: Int)
                        else (read b :: Int)
          if larger `mod` smaller == 0
          then putStrLn (show larger ++ " is divisible by " ++ show smaller )
          else putStrLn (show larger ++ " is not divisible by " ++ show smaller)
