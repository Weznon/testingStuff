grid :: [Integer]
grid = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 1, 1, 1, 0,
        0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 1, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
printGrid :: (Show t) => [t] -> IO ()
printGrid list = do
                    print [list !! x | x <-[0..9]]
                    print [list !! x | x <-[10..19]]
                    print [list !! x | x <-[20..29]]
                    print [list !! x | x <-[30..39]]
                    print [list !! x | x <-[40..49]]
                    print [list !! x | x <-[50..59]]
                    print [list !! x | x <-[60..69]]
                    print [list !! x | x <-[70..79]]
                    print [list !! x | x <-[80..89]]
                    print [list !! x | x <-[90..99]]

coordGet :: (Num a) => [a] -> Int -> Int -> a
coordGet board x y = if x < 0 || x > 9 || y < 0 || y > 9
                    then 0
                      else board !! (10 * y + x)
getSurround :: (Num a) => [a] -> Int -> Int -> a
getSurround board x y = sum [coordGet board (x - w) (y - z) | w <- [-1..1], z <- [-1..1]] - coordGet board x y


liveOrDie :: (Num a1, Eq a1, Num a) => [a1] -> Int -> Int -> a
liveOrDie board x y = do
                        let value = coordGet board x y
                        let liveNextTo = getSurround board x y
                        if value == 0
                          then if liveNextTo == 3
                                  then 1
                                else 0
                        else if liveNextTo == 2 || liveNextTo == 3
                                  then 1
                                else 0

generateNextBoard :: (Eq a, Num a) => t -> a -> [Integer]
generateNextBoard board 0 = grid
generateNextBoard board n = [liveOrDie (generateNextBoard board (n-1)) x y | y <- [0..9], x <- [0..9]]
--Originally had x first, but that flips the axis, since it does x = 1 && y = [0..9] then x=2..., but it should be the other way around.

lifeGen :: (Eq a, Num a) => [Integer] -> a -> [[Integer]]
lifeGen board iteration
    |iteration == 0     = [board]
    |otherwise          = generateNextBoard board iteration : lifeGen board (iteration - 1)

printGrids :: (Show t, Integral t) => [[t]] -> Int -> IO ()
printGrids boards iteration
    |iteration == 0     = printGrid (boards !! 0)
    |iteration `mod` 2 /= 0   = do
                            putStrLn"--------------------"
                            printGrids boards (iteration - 1)
    |iteration `mod` 2 == 0 = do
                            printGrid (boards !! (iteration `div` 2))
                            printGrids boards (iteration - 1)


main :: IO ()
main = do
          let boards = lifeGen grid 10
          printGrids boards 20
