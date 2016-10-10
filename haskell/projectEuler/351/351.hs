primes :: [Integer]
primes = 2 : primes'
  where isPrime (p:ps) n = p*p > n || n `rem` p /= 0 && isPrime ps n
        primes' = 3 : filter (isPrime primes') [5, 7 ..]

doesDivide :: Integer -> Integer -> Bool
doesDivide n m = n `mod` m == 0

primeFactors n =
  case factors of
    [] -> [n]
    _  -> factors ++ primeFactors (n `div` (head factors))
  where factors = take 1 $ filter (\x -> (n `mod` x) == 0) [2 .. n-1]

totient :: Integer -> Integer
totient n = numerator `div` denominator
            where numerator = n * (product (map (\x -> x - 1) (primeFactors n)))
                  denominator = product (primeFactors n)

answer :: Integer
answer = sum (map (totient) [1..100])


main :: IO()
main = print answer
