import Data.List

factorial :: Int -> Int
factorial 0 = 1
factorial x = x * factorial (x-1)

maxNum :: Int
maxNum = factorial 20

listTest :: [Int]
listTest = [11,12,13,14,15,16,17,18,19,20]

isDivisible :: Int -> [Bool]
isDivisible x = map (\(y) -> x `mod` y == 0) (listTest)

testList :: [Bool] -> Bool
testList x = all (id) (x)

bash = find (testList . isDivisible) [1..maxNum]

main :: IO()
main = print (bash)
--Takes about 22.5 seconds on the lenovo
