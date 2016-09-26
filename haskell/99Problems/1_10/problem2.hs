--Find the last but one element of a list
--secondToLast "hello"
--l

secondToLast :: [t] -> t
secondToLast [] = error "You can't find the second to last of an empty list"
secondToLast [x] = error "You can't find the second to last of a list with one list"
secondToLast [x, y] = x
secondToLast (_:xs) = secondToLast xs

main :: IO ()
main = putStrLn "Hello World"
