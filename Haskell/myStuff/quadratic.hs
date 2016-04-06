
quadratic a b c = [(-b + sqrt(b ^ 2 - 4 * a * c)) / (2 * a), (-b - sqrt(b ^ 2 - 4 * a * c)) / (2 * a)]
main :: IO ()
main = do let x = quadratic 1.5 3.5 2.5
          putStrLn "The roots of x^2 + 3x + 2"
          print x
