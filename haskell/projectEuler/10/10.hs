main :: IO()
main = print (primes !! 10000)

primes = 2 : primes'
  where isPrime (p:ps) n = p*p > n || n `rem` p /= 0 && isPrime ps n
        primes' = 3 : filter (isPrime primes') [5, 7 ..]
--doesn't stop, but generates the prime pretty damn quickly so...
