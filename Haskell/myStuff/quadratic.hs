
quadratic :: (Num t, Floating t, Fractional t) => t -> t -> t -> [t]
quadratic a b c = [(-b + sqrt(b ^ 2 - 4 * a * c)) / (2 * a), (-b - sqrt(b ^ 2 - 4 * a * c)) / (2 * a)]
main :: IO ()
main = do
          a <- do putStrLn "Input a:"
                  getLine
          b <- do putStrLn "Input a:"
                  getLine
          c <- do putStrLn "Input a:"
                  getLine
          let x = quadratic (read a :: Float) (read b :: Float) (read c :: Float)
          putStrLn "The roots of x^2 + 3x + "
          print x
