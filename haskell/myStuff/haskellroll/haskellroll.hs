import System.Random
import System.IO.Unsafe

data Direction = Up
               | Down
               | Left
               | Right
               | Forward
               | Backward
  deriving Show
getEwe :: Int -> Direction
getEwe rand
    |rand == 1 = getEwe randomInt
    |rand == 2 = Main.Down
    |rand == 3 = Main.Left
    |rand == 4 = Main.Right
    |rand == 5 = Main.Forward

around :: Direction -> Maybe Direction
around you = Nothing

randomInt :: Int
randomInt = unsafePerformIO (getStdRandom (randomR (1, 5)))

main :: IO()
main = do
        --let u = Main.Down
        print (getEwe randomInt)


{-
This code will  never give ewe up, since it will loop to another instance
                never let u down, that line is commented.
                never runs around, as the function is never called
                never deserts you, since around is never executed to give you an empty value

-}
