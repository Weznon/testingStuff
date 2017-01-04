a :: Integer
a = product [1..100]

as :: Integer -> [Integer]
as 0 = []
as x = x `mod` 10:(as (x `div` 10))

main :: IO()
main = print $ sum $ as a
