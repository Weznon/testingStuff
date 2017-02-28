a :: [Int]
a = [1..998]
b :: [Int]
b = [1..998]
c :: [Int]
c = [1..998]

testPythag :: Int -> Int -> Int -> Bool
testPythag x y z = x * x + y * y == z * z

answer :: [Int]
answer = filter (/= 0) [if (testPythag x y z && x + y + z == 1000) then x * y * z else 0 | x <- a, y <- b, z <- c]


main :: IO()
main = print answer
--takes about 4.920 seconds on the dell
