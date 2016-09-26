--Find the K'th element of a list. The first element in the list is number 1
--listGet "hello" 2
--e

listGet :: (Eq a, Num a) => [a1] -> a -> a1
listGet x 1 = head x
listGet (_:xs) n = listGet xs (n-1)

main :: IO ()
main = putStrLn "Hello World"
