import Math.NumberTheory.Primes
import Math.NumberTheory.ArithmeticFunctions
prime :: [Integer]
--primes = 2 : primes'
--  where isPrime (p:ps) n = p*p > n || n `rem` p /= 0 && isPrime ps n
--        primes' = 3 : filter (isPrime primes') [5, 7 ..]
prime = takeWhile (\x -> x < 100000000) primes
doesDivide :: Integer -> Integer -> Bool
doesDivide n m = n `mod` m == 0

--primeFactors :: Integer -> [Integer]
--primeFactors n = if (prime == []) then [n] else prime
--                where --sqrtN = toInteger (floor (sqrt (fromInteger n)))
--                      prime = filter (\x -> doesDivide n x) ((takeWhile (\x -> x <= n) primes))
--Instead of taking prime factorization, generate a list of all possible prime factorizations
--should be must faster

--primeFactorList :: [[Int]]
--primeFactorList = [


primeFactorsRep :: Integer -> [Integer]
primeFactorsRep 1 = []
primeFactorsRep n
  | factors == []  = [n]
  | otherwise = factors ++ primeFactorsRep (n `div` (head factors))
  where factors = take 1 $ filter (\x -> (n `mod` x) == 0) primesTest
        primesTest = takeWhile (\x -> x <= n) prime

--removes duplicates wtf this is so slow i need to figure out how to remove this
remDup :: [Integer] -> [Integer]
remDup [] = []
remDup [x] = [x]
--remDup [x, y] = if (x == y) then [] else [y]
remDup (x:y:xs) = if (x == y) then (remDup (x:xs)) else x:(remDup (y:xs))

primeFactors :: Integer -> [Integer]
primeFactors = remDup . primeFactorsRep

data Merp = Yup Int | Nope
  deriving (Show, Eq)

primeLists :: [[Merp]]
primeLists = [[Nope]]

totient2 :: Integer -> Integer
totient2 n
-- |even n     = totient (n `div` 2) -- this is not right, why is it here this literally makes no sense
    |otherwise  = numerator `div` denominator
            where numerator = n * (product (map (\x -> x - 1) (primeFactors n)))
                  denominator = product (primeFactors n)

sumTot :: Integer -> Integer
sumTot n = sum (map (totient2) [1..n])

hidden :: Integer -> Integer
hidden n = 6 * (sum (map (\x -> x - Math.NumberTheory.ArithmeticFunctions.totient x) [1..n]))

answer :: Integer
answer = hidden 6

main :: IO()
main = print $ hidden 100000000
