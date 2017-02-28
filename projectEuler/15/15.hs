--It's just 40 choose 20 cuz math
factorial :: Integer -> Integer
factorial 0 = 1
factorial x = x * factorial (x-1)


answer = factorial 40 `div` (factorial 20 * factorial 20)


main :: IO()
main = print answer
