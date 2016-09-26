--Reverse a list
--myReverse "Hello"
--"olleH"

myReverse :: [t] -> [t]
myReverse [] = []
myReverse [x] = [x]
myReverse (x:xs) = myReverse xs ++ [x]

main :: IO ()
main = putStrLn "Hello World"
