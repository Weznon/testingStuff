--Find the Last Element of a List
--last [1, 2, 3, 4]
--4

myLast :: [t] -> t
myLast [] = error "You cannot find the last of an empty list!"
myLast [x] = x
myLast (_:xs) = myLast xs

main :: IO ()
main = putStrLn "Hello World"
