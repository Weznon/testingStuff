sumSquares :: Int
sumSquares = sum (map (\x -> x * x) [1..100])

square :: Int
square = sum([1..100]) * sum ([1..100])

main :: IO()
main = print (sumSquares - square)
--Takes about .052 seconds on the lenovo
--Takes about .001 seconds on the dell lmfao
