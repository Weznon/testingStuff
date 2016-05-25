primes :: [Int]
primes = 2 : primes'
  where isPrime (p:ps) n = p*p > n || n `rem` p /= 0 && isPrime ps n
        primes' = 3 : filter (isPrime primes') [5, 7 ..]

main :: IO()
main = print (sum (takeWhile (<= 2000000) primes))
--takes .770 seconds on dell
