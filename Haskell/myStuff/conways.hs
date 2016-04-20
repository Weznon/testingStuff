grid :: [[Int]]
grid = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 1, 1, 1, 0],
        [0, 0, 0, 0, 0, 0, 1, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]

coordGet :: (Num a) => [[a]] -> Int -> Int -> a
coordGet list x y = if x > 0 && y > 0 && x < length (list !! 1) && y < length list
                  then (list !! y) !! x
                else 0


coordSurround :: (Num a) => [[a]] -> Int -> Int -> a
coordSurround list x y = sum [coordGet list (x - w) (y - z) | w <- [-1, 0, 1], z <- [-1, 0, 1]] - coordGet list x y

liveOrDie :: (Num a, Num a1, Eq a1) => [[a1]] -> Int -> Int -> a
liveOrDie list x y = do
                  let coordie = coordGet list x y
                  let cells = coordSurround list x y
                  if coordie == 0
                    then if cells == 3
                            then 1
                          else 0
                  else if cells == 2 || cells == 3
                          then 1
                        else 0


nextLine list z = [liveOrDie list x z | x <- [0..length list - 1]]

main :: IO ()
main = do
        print $ grid !! 0
        print $ grid !! 1
        print $ grid !! 2
        print $ grid !! 3
        print $ grid !! 4
        print $ grid !! 5
        print $ grid !! 6
        print $ grid !! 7
        print $ grid !! 8
        print $ grid !! 9
        print "-------------------------------------------------------"
        b <- getLine
        let gridTwo = [nextLine grid 0, nextLine grid 1, nextLine grid 2, nextLine grid 3, nextLine grid 4, nextLine grid 5, nextLine grid 6, nextLine grid 7, nextLine grid 8, nextLine grid 9]
        print $ nextLine grid 0
        print $ nextLine grid 1
        print $ nextLine grid 2
        print $ nextLine grid 3
        print $ nextLine grid 4
        print $ nextLine grid 5
        print $ nextLine grid 6
        print $ nextLine grid 7
        print $ nextLine grid 8
        print $ nextLine grid 9
        a <- getLine
        print "-------------------------------------------------------"
        print $ nextLine gridTwo 0
        print $ nextLine gridTwo 1
        print $ nextLine gridTwo 2
        print $ nextLine gridTwo 3
        print $ nextLine gridTwo 4
        print $ nextLine gridTwo 5
        print $ nextLine gridTwo 6
        print $ nextLine gridTwo 7
        print $ nextLine gridTwo 8
        print $ nextLine gridTwo 9
