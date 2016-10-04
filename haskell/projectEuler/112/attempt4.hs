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

initial :: (Int, Int)
--initial = (21780, 19602)
initial = (1586902, 1571031)
next :: (Int, Int) -> (Int, Int)
next (a, b)= (a + 1, if isBouncy(a + 1) then b + 1 else b)

staisfies :: (Int, Int) -> Bool
staisfies (a, b) = (a * 99 `div` 100 == b)

finder :: (Int, Int) -> Int
finder a = if staisfies a then (fst a) else (finder (next a))

main :: IO()
main = print (finder initial)
