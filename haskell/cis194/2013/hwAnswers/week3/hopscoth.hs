skips :: [a] -> [[a]]
skips x = [[x !! (t - 1) | t <- [n, 2*n..(length x)]] | n <- [1..(length x)]]
