--Find out if a list is a plalindrome
--isPali [1,2,3,4,5,6,7,8]
--false
--isPali [1,2,3,2,1]
--true

myReverse :: [t] -> [t]
myReverse [] = []
myReverse [x] = [x]
myReverse (x:xs) = myReverse xs ++ [x]

isPali :: (Eq t) => [t] -> Bool
isPali x = x == myReverse x

main :: IO ()
main = putStrLn "Hello"
