toDigits :: Integer -> [Integer]
toDigits 0 = []
toDigits n = toDigits (n `div` 10) ++ [n `mod` 10]

toDigitsRev :: Integer -> [Integer]
toDigitsRev 0 = []
toDigitsRev n = [n `mod` 10] ++ toDigitsRev (n `div` 10)

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther xs = [if (even c) then (xs !! c) * 2 else xs !! c | c <- [0..(length xs) - 1]]

sumDigits :: [Integer] -> Integer
sumDigits x = sum (curry (map toDigits x))
