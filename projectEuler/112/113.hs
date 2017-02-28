import Data.List
toList :: Int -> [Int]
toList 0 = []
toList i = ((rem i 10):toList (i `div` 10))

toLister :: Int -> [Int]
toLister = reverse . toList

isInc :: [Int] -> Bool
isInc [x] = True
isInc (x:y:[]) = (x <= y)
isInc (x:y:xs) = (x <= y) && isInc (y:xs)

isDec :: [Int] -> Bool
isDec [x] = True
isDec (x:y:[]) = (x >= y)
isDec (x:y:xs) = (x >= y) && isDec (y:xs)

isBouncy :: Int -> Bool
isBouncy i = ((not (isDec is)) && (not (isInc is)))
            where is = toLister i

calcB :: Fractional a => Int -> a
calcB i = fromIntegral (length (filter (isBouncy) [1..i])) / fromIntegral i

calced :: Fractional a => [(Int, a)]
calced = [(i, calcB i) | i <- [27180..]]

main :: IO()
main = print (find (\x -> (snd x) >= 0.99) calced)
