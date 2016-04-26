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
generateNextBoard :: (Eq a, Num a, Num t) => [a] -> [t]
generateNextBoard board = [liveOrDie board x y | x <- [0..9], y <- [0..9]]

--figure out why the fuck this doesn't work
--generates the next board, then again, again...initial board
--need to remake generateNextBoard to be recursive, to allow it to generate abritrary board
--Figured it out: board never changes
--TODO: Actually get it to print the stuff
lifeGen :: (Eq a, Num a, Eq t, Num t) => [t] -> a -> [[t]]
lifeGen board iteration
    |iteration == 0     = [board]
    |otherwise          = generateNextBoard board : lifeGen board (iteration - 1)
main = do
          let grid2 = [liveOrDie grid x y | x <- [0..9], y <- [0..9]]
          printGrid grid
          printGrid grid2
