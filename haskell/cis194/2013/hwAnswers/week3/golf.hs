--Excersize 1, Hopscotch
skips :: [a] -> [[a]]
skips x = [[x !! z | z <- [y-1, 2*y-1..(length x)-1]] | y <- [1..(length x)]]

--Excersize 2, Local Maxima
localMaxima :: [Integer] -> [Integer]
localMaxima x = filter isMax x
                where isMax n = (x !! n+1 < x !! n) && (x !! n-1 < x !! n)
                      isMax 0 = False
                      isMax ((length x) - 1) = False
