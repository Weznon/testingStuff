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
generateNextBoard board n = [liveOrDie (generateNextBoard board (n-1)) x y | x <- [0..9], y <- [0..9]]


lifeGen :: (Eq a, Num a) => [Integer] -> a -> [[Integer]]
lifeGen board iteration
    |iteration == 0     = [board]
    |otherwise          = generateNextBoard board iteration : lifeGen board (iteration - 1)

main :: IO ()
main = do
          let boards = lifeGen grid 10
          printGrid (boards !! 0)
          putStrLn"----------------------"
          printGrid (boards !! 1)
          putStrLn"----------------------"
          printGrid (boards !! 2)
          putStrLn"----------------------"
          printGrid (boards !! 3)
          putStrLn"----------------------"
          printGrid (boards !! 4)
          putStrLn"----------------------"
          printGrid (boards !! 5)
          putStrLn"----------------------"
          printGrid (boards !! 6)
          putStrLn"----------------------"
          printGrid (boards !! 7)
          putStrLn"----------------------"
          printGrid (boards !! 8)
          putStrLn"----------------------"
          printGrid (boards !! 9)
          putStrLn"----------------------"
