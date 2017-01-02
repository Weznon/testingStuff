import Math.NumberTheory.Primes

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
pr2 = takeWhile (\x -> x < 100) primes

--Long list of primes, packed
prime :: [Packed]
prime = map insert pr

--shorter list of primes, packed
prime2 :: [Packed]
prime2 = map insert pr2

--generates a list of packed that says whether its a prime or not
generatePrimeList :: Packed -> [Packed]
generatePrimeList (Num x) = take 100 $ cycle $ [Emp | ayy <- [1..(x-1)]] ++ [(Num x)]
generatePrimeList Emp = take 100 $ cycle [Emp]

--generates the list of packed lists that need to be flattened into the factorizations
toFlatten :: [[Packed]]
toFlatten = map generatePrimeList prime2

--generates the prime factorizations
flatten :: [[Packed]] -> [[Packed]]
flatten (x:xs) =

main :: IO()
main = print $ sum pr
