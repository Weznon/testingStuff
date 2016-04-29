--Reverse a list
--myReverse "Hello"
--"olleH"

myLast :: [t] -> t
myLast [] = error "No head of empty list"
myLast [x] = x
myLast (_:xs) = myLast xs

myInit :: [[t]] -> [t]
myInit [] = error "No init of empty list"
myInit [x] = []
myInit (x:xs) = x ++ myInit xs

--myReverse [x] = [x]
--myReverse (x:xs) =  : myReverse

main :: IO ()
main = putStrLn "Hello World"
