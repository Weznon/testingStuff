--Generates Hailstone Sequence for a number

hailstone :: (Integral a) => a -> a
hailstone n
        |n `mod` 2 == 0         = n `div` 2
        |otherwise              = 3*n + 1

hailstoneSequence :: (Integral a) => a -> [a]
hailstoneSequence 1 = [1]
hailstoneSequence x = x : hailstoneSequence (hailstone x)

main :: IO()
main = do
          putStrLn "What number to calculate the hailstone sequence for?"
          a <- getLine
          print (hailstoneSequence (read a))
