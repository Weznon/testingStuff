import Math.NumberTheory.Primes hiding (primeList, totient)
import Data.List

val :: Int
val = 100000000

primeList :: [Integer]
primeList = takeWhile (< fromIntegral val) primes

generateLists :: Integer -> [Integer]
generateLists x = take val $ cycle $ take (fromIntegral $ x-1) (repeat 0) ++ [x]

toFl :: [[Integer]]
toFl = map generateLists primeList

combine :: [[Integer]] -> [Integer] -> [[Integer]]
combine (f:[]) (x:[]) = [x `mash` f]
combine (f:fs) (x:xs) = [x `mash` f] ++ (combine fs xs)

mash :: Integer -> [Integer] -> [Integer]
mash x y = if x == 0 then y else x:y

flatten :: [[Integer]] -> [[Integer]]
flatten ps = foldl' (combine) blank ps
  where blank = take val (repeat [])

factors :: [[Integer]]
factors = flatten toFl

totient :: Integer -> Integer
totient n = numer `div` denom
  where z = factors !! (fromIntegral n - 1)
        numer = n * (product (map (\x -> x - 1) z))
        denom = product z

main :: IO()
main = do
  print $ 6 * (sum ( map (\x -> x - totient x) [1..(fromIntegral val)]))
