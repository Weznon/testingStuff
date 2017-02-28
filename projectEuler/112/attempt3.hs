import Data.List
toList :: (Fractional a, Eq a, Integral a) => a -> [a]
toList 0 = []
toList i = ((rem i 10):toList (i `div` 10))

toLister :: (Fractional a, Eq a, Integral a) => a -> [a]
toLister = reverse . toList

isInc :: (Fractional a, Eq a, Integral a) => [a] -> Bool
isInc [x] = True
isInc (x:y:[]) = (x <= y)
isInc (x:y:xs) = (x <= y) && isInc (y:xs)

isDec :: (Fractional a, Eq a, Integral a) => [a] -> Bool
isDec [x] = True
isDec (x:y:[]) = (x >= y)
isDec (x:y:xs) = (x >= y) && isDec (y:xs)

isBouncy :: (Fractional a, Eq a, Integral a) => a -> Bool
isBouncy i = ((not (isDec is)) && (not (isInc is)))
            where is = toLister i

initial :: (Fractional a, Eq a, Integral a) => (a, a)
initial = (21780, 19602)

next :: (Fractional a, Eq a, Integral a) => (a, a) -> (a, a)
next (a, b)= (a + 1, if isBouncy(a + 1) then b + 1 else b)

staisfies :: (Fractional a, Eq a, Integral a) => (a, a) -> Bool
staisfies (a, b) = a / b == 0.99

finder :: (Fractional a, Eq a, Integral a) => (a, a) -> a
finder a = if staisfies a then (fst a) else (finder (next a))

main :: (Fractional a, Eq a, Integral a) => IO()
main = print (finder initial)
