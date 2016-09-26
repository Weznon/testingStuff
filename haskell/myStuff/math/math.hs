bashList :: [Int]
bashList = [01..99]

basher :: Int -> (Bool, Int, Int)
basher x
        |(x ^ 2) `mod` 100 == x     = (True, x, 2)
        |(x ^ 3) `mod` 100 == x     = (True, x, 3)
        |(x ^ 4) `mod` 100 == x     = (True, x, 4)
        |(x ^ 5) `mod` 100 == x     = (True, x, 5)
        |otherwise                  = (False,x, 0)

bashed :: [(Bool, Int, Int)]
bashed = map basher bashList

filterB :: (Bool, Int, Int) -> Bool
filterB (x, _, _) = if x then True else False

filtrate :: [(Bool, Int, Int)]
filtrate = filter filterB bashed

condense :: (Bool, Int, Int) -> (Int, Int)
condense (_, x, y) = (x, y)

final :: [(Int, Int)]
final = map condense filtrate

main :: IO()
main = print final
