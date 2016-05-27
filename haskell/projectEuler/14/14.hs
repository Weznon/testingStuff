import Data.List
import Data.Ord
collatz :: Int -> [Int]
collatz x
        |x == 1         = []
        |x `rem` 2 == 0 = x : collatz (x `div` 2)
        |otherwise      = x : collatz (3 * x + 1)

collatzMil :: [(Int, Int)]
collatzMil = [(x, length (collatz x)) | x <- [1..1000000]]

answer :: (Int, Int)
answer = maximumBy (comparing snd) collatzMil

main :: IO()
main = do
        print (fst answer)
        putStrLn "Number"
        print (snd answer)
        putStrLn "Length of Collatz Sequence"
--Takes 6.846 seconds on the dell
