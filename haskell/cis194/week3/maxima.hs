localMaxima :: [Integer] -> [Integer]
localMaxima x = [if (x !! y > x !! (y-1) && x !! y > x !! (y + 1)) then x !! y else _ | y <- [0..(length x) - 1]]
