grid :: [Int]
grid = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 1, 1, 1, 0,
        0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 1, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

coordGet :: (Num a) => [[a]] -> Int -> Int -> a
coordGet list x y = if x > 0 && y > 0 && x < length (list !! 1) && y < length list
                  then (list !! y) !! x
                else 0


coordSurround :: (Num a) => [[a]] -> Int -> Int -> a
coordSurround list x y = sum [coordGet list (x - w) (y - z) | w <- [-1, 0, 1], z <- [-1, 0, 1]] - coordGet list x y

--liveOrDie :: (Num a, Num a1, Eq a1) => [[a1]] -> Int -> Int -> a
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

nextLife list = [liveOrDie list x y | x <- [0..9], y <- [0..9]]

printListBy10 list = putStrLn [list !! x | x <- [0..9]]
main :: IO ()
main = putStrLn "fuckthis"
