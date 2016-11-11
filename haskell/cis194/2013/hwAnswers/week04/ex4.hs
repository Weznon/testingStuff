import Data.List
sieveSundaram :: Integer -> [Integer]
sieveSundaram n = map (\n -> 2 * n + 1) (ayy \\ minus)
                where   minus = map (\(x, y) -> x + y + 2 * x * y) (cartProd [1..n] [1..n])
                        ayy   = [1..n]
cartProd :: [a] -> [b] -> [(a, b)]
cartProd xs ys = [(x, y) | x <- xs, y <- ys]
