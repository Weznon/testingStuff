primes :: [Int]
primes = 2 : primes'
  where isPrime (p:ps) n = p*p > n || n `rem` p /= 0 && isPrime ps n
        primes' = 3 : filter (isPrime primes') [5, 7 ..]

primeLim :: [Int]
primeLim = takeWhile (\x -> x < 100000000) primes

genAll :: Int -> [[Int]]
genAll n = map (\x -> n:[x]) (takeWhile (\x -> x <= (100000000 `div` n)) primeLim)

primeTable :: Int -> [Int]
primeTable x = [if (i `mod` x == 0) then x else 0 | i <- [1..100000000]]

allPrimeTable :: [[Int]]
allPrimeTable = [primeTable x | x <- primeLim]

primeFactorTable :: [[Int]]
primeFactorTable = [filter (\x -> x /= 0) [(allPrimeTable !! y) !! x | y <- [0..(length allPrimeTable - 1)]] | x <- [0..99999999]]

totient :: Int -> [Int] -> Int
totient x y = numerator `div` denominator
  where numerator = x * (product (map (\x -> x - 1) y))
        denominator = product y

totientThing :: [Int]
totientThing = [x - totient x (primeFactorTable !! (x - 1)) | x <- [1..100000000]]

answer :: Int
answer = sum totientThing

main :: IO()
main = print answer

