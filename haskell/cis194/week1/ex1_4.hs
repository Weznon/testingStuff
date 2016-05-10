--Turns an integer into a list of digits
toDigits :: Integer -> [Integer]
toDigits 0 = []
toDigits x = toDigits (x `div` 10) ++ [x `mod` 10]

--Turns an integer into a list of digits, but reversed
toDigitsRev :: Integer -> [Integer]
toDigitsRev 0 = []
toDigitsRev x = [x `mod` 10] ++ toDigitsRev (x `div` 10)

--Doubles every other number in a list
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther x = [if (count `mod` 2 == 0) then (2 * (x !! count)) else (x !! count) | count <- [0..(length x - 1)]]

--Sums all digits of a list of integers
sumDigits :: [Integer] -> Integer
sumDigits x = sum [x !! y `div` 10 + x !! y `mod` 10 | y <- [0..length x - 1]]

--Determines if a credit card number is valid or not
isValidCard :: Integer -> Bool
isValidCard x = sumDigits (doubleEveryOther (toDigits x)) `mod` 10 == 0
main :: IO()
main = print [isValidCard 4012888888881882, isValidCard  4012888888881881]
