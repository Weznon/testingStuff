grid = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 8, 0, 1, 1, 1, 0,
        0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 1, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
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

liveOrDie list x y = do
                        let value = coordGet list x y
                        let liveNextTo = getSurround list x y
                        if value == 0
                          then if liveNextTo == 3
                                  then 1
                                else 0
                        else if liveNextTo == 2 || liveNextTo == 3
                                  then 1
                                else 0
main = do
          let grid2 = [liveOrDie grid x y | x <- [0..9], y <- [0..9]]
          printGrid grid
          printGrid grid2
