import Math.NumberTheory.Primes

data Packed = Num Integer | Emp

instance Show Packed where
  show (Num s) = show s
  show Emp = "_"

concat :: Packed -> Packed -> [Packed]

concat Emp z  = [z]
concat z Emp  = [z]
concat x z    = [x, z]

insert :: Integer -> Packed
insert x = (Num x)

pr :: [Integer]
pr = takeWhile (\x -> x < 100000000) primes

pr2 :: [Integer]
pr2 = takeWhile (\x -> x < 100) primes

prime :: [Packed]
prime = map insert pr

prime2 :: [Packed]
prime2 = map insert pr2

generatePrimeList :: Packed -> [Packed]
generatePrimeList (Num x) = take 100 $ cycle $ [Emp | ayy <- [1..(x-1)]] ++ [(Num x)]
generatePrimeList Emp = take 100 $ cycle [Emp]

toFlatten :: [[Packed]]
toFlatten = map generatePrimeList prime2

flatten :: [[Packed]] -> [[Packed]]
flatten x =

main :: IO()
main = print $ sum pr
