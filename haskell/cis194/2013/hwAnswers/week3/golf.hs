--Excersize 1, Hopscotch
skips :: [a] -> [[a]]
skips x = [[x !! z | z <- [y-1, 2*y-1..(length x)-1]] | y <- [1..(length x)]]

--Excersize 2, Local Maxima
localMaxima :: [Integer] -> [Integer]
localMaxima (x:y:z:xs) = if (y > x && y > z) then [y] ++ localMaxima ([y] ++ [z] ++ xs) else localMaxima ([y] ++ [z] ++ xs)
localMaxima x = []

--Excersize 3, Histogram
--ayy takes a list of integers and produces a list that says how many of each there are
ayy :: [Integer] -> [Int]
ayy x = [length (filter (\z -> z == y) x) | y <- [0..9]]

histrogram :: [Integer] -> String
histrogram x = 
                where ayyed = ayy x
                      maxed = max ayyed
