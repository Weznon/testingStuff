isLeapYear x =  if x `mod` 4 == 0
                then  if    x `mod` 100 == 0 && x `mod` 400 /= 0
                      then  False
                      else  True
                else False
main = do putStrLn "Enter a year: "
          x <- getLine
          let x' = read x :: Int
          if isLeapYear x'
          then putStrLn (x ++ " is a leap year")
          else putStrLn (x ++ " is not a leap year")
