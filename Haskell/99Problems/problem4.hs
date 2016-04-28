--Find the number of elements of a list.
--lengthOf [1,2,3,4,5]
--5

myLength :: (Num a) => [t] -> a
myLength [] = 0
myLength [x] = 1
myLength (_:xs) = 1 + myLength xs

main = putStrLn "Hello World"
