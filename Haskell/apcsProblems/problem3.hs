--Copy of the quadratic.hs
quadratic :: (Float, Float, Float) -> (Float, Float)
quadratic (a, b, c) = (x1, x2)
                  where
                      x1 = e + sqrt d / (2 * a)
                      x2 = e - sqrt d / (2 * a)
                      d = b * b - 4 * a * c
                      e = - b / (2 * a)
main :: IO ()
main = do
          a <- do putStrLn "Input a:"
                  getLine
          b <- do putStrLn "Input b:"
                  getLine
          c <- do putStrLn "Input c:"
                  getLine
          putStrLn ("The roots of " ++ a ++ "x^2 + " ++ b ++ "x + " ++ c)
          print $ quadratic (read a :: Float, read b :: Float, read c :: Float)
