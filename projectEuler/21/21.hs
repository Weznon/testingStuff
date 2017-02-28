factors :: Int -> [Int]
factors i = filter (\x -> i `mod` x == 0) [1..(i-1)]

factorSums :: [Int]
factorSums = map (sum . factors) [1..10000]

pairs :: [(Int, Int)]
pairs = zipWith (\x y -> (x, y)) [1..10000] factorSums

createAm :: [((Int, Int), (Int, Int))]
createAm = map (\x -> (x, if (snd x - 1 > 9998) then (0, 0) else pairs !! (snd x - 1))) ((tail pairs))

isAmicable :: ((Int, Int), (Int, Int)) -> Int
isAmicable ((x, xs), (y, ys)) = if (xs == y && x == ys) then 1 else 0

merp :: Int
merp = sum $ map isAmicable createAm

main :: IO()
main = print (merp)

