import Math.NumberTheory.Primes
import Data.List hiding (insert)

data Packed = Num Integer | Emp

instance Show Packed where
  show (Num s) = show s
  show Emp = "_"

--Takes an Integer and packs it
insert :: Integer -> Packed
insert x = (Num x)

--Long list of primes, unpacked
pr :: [Integer]
pr = takeWhile (\x -> x < 100000000) primes

--shorter list of primes, unpacked
pr2 :: [Integer]
pr2 = takeWhile (\x -> x < 100000) primes

--Long list of primes, packed
prime :: [Packed]
prime = map insert pr

--shorter list of primes, packed
prime2 :: [Packed]
prime2 = map insert pr2

--generates a list of packed that says whether its a prime or not
generatePrimeList :: Packed -> [Packed]
generatePrimeList (Num x) = take 100000 $ cycle $ [Emp | ayy <- [1..(x-1)]] ++ [(Num x)]
generatePrimeList Emp = take 100000 $ cycle [Emp]

--generates the list of packed lists that need to be flattened into the factorizations
toFlatten :: [[Packed]]
toFlatten = map generatePrimeList prime2

--generates the prime factorizations
flatten :: [[Packed]] -> [[Packed]]
flatten ps = foldl' (combine) blank ps
  where blank = replicate 100000 []

--adds one cycled factors to a list of factorizations
combine :: [[Packed]] -> [Packed] -> [[Packed]]
combine (f:[]) (x:[]) = [x `mash` f]
combine (f:fs) (x:xs) = [x `mash` f] ++(combine fs xs)

mash :: Packed -> [Packed] -> [Packed]
mash Emp x  = x
mash x y    = x:y

main :: IO()
main = do
          return $! flatten toFlatten;
          print $ flatten toFlatten
