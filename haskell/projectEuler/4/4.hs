isPalin :: Int -> Bool
isPalin x = reverse(show x) == (show x)


makeList = concat [[x * y | y <- [100..999]] | x <- [100..999]]

solve :: [Int]
solve = filter (isPalin) (makeList)

main :: IO()
main = print (maximum solve)
--Takes .390 seconds on the lenovo
