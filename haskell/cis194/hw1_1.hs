--Turns an integer into a list of digits
toDigits :: Integer -> [Integer]
toDigits 0 = []
toDigits x = toDigits (x `div` 10) ++ [x `mod` 10]
--Turns an integer into a list of digits, but reversed
toDigitsRev :: Integer -> [Integer]
toDigitsRev 0 = []
toDigitsRev x = [x `mod` 10] ++ toDigitsRev (x `div` 10)
