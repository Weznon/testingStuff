isSpontaneous :: Integer -> Bool
isSpontaneous n = n > 0

gibbs :: Integer -> Integer -> Integer -> Integer
gibbs h t s = h - (t * s)

