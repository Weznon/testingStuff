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


coordGet list x y = if x > 9 || y > 9 || x < 0 || y < 0
                    then 0
                    else list !! (10 * y + x)
getSurround list x y = sum [coordGet list (x + w) (y + z) | w <- [-1..1], z <- [-1..1]] - coordGet list x y

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

--Attempt at recursively defining it, but it was way too slow
--Too slow
--generateNextBoard board 0 = grid
--generateNextBoard board n = [liveOrDie (generateNextBoard board (n-1)) x y | x <- [0..9], y <- [0..9]]
generateNextBoard board  = [liveOrDie board x y | x <- [0..9], y <- [0..9]]
--figure out why the fuck this doesn't work
--generates the next board, then again, again...initial board
--need to remake generateNextBoard to be recursive, to allow it to generate abritrary board
--Figured it out: board never changes
--TODO: Actually get it to print the stuff
--lifeGen :: (Eq a, Num a, Eq t, Num t) => [t] -> a -> [[t]]
--lifeGen board iteration
--    |iteration == 0     = [board]
--    |otherwise          = generateNextBoard board iteration : lifeGen board (iteration - 1)
--Bashy Way of Printing
main = do
          let grid1 = generateNextBoard grid
          let grid2 = generateNextBoard grid1
          let grid3 = generateNextBoard grid2
          let grid4 = generateNextBoard grid3
          let grid5 = generateNextBoard grid4
          let grid6 = generateNextBoard grid5
          let grid7 = generateNextBoard grid6
          let grid8 = generateNextBoard grid7
          let grid9 = generateNextBoard grid8
          let grid10 = generateNextBoard grid9
          printGrid grid
          putStrLn "----------"
          printGrid grid1
          putStrLn "----------"
          printGrid grid2
          putStrLn "----------"
          printGrid grid3
          putStrLn "----------"
          printGrid grid4
          putStrLn "----------"
          printGrid grid5
          putStrLn "----------"
          printGrid grid6
          putStrLn "----------"
          printGrid grid7
          putStrLn "----------"
          printGrid grid8
          putStrLn "----------"
          printGrid grid9
          putStrLn "----------"
          printGrid grid10
          putStrLn "----------"
