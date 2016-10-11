fib :: Integer -> Integer
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

fibs2 :: [Integer]
fibs2 = 1:1:(zipWith (+) fibs2 (tail fibs2))