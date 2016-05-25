divisors :: Int -> [Int]
divisors k = 1 : divisors' 2 k
  where
    divisors' n k
      | n * n > k      = [k]
      | n * n == k     = [n, k]
      | k `mod` n == 0 = (n : (k `div` n) : result)
      | otherwise      = result
      where result = divisors' (n + 1) k

triangdivs = [(n * (n + 1) `div` 2, tdivcount n) | n <- [1 .. ]]
  where
    tdivcount n
      | n <= 3    = n
      | even n    = divcount (n `div` 2) * divcount (n + 1)
      | otherwise = divcount n * divcount ((n + 1) `div` 2)
      where
        divcount = length . divisors

main = print (fst . head . filter ((> 500) . snd) $ triangdivs)
