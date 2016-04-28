--Reverse a list
--myReverse "Hello"
--"olleH"

myReverse [] = []
myReverse [x:xs] = xs:myReverse x

main :: IO ()
main = putStrLn "Hello World"
