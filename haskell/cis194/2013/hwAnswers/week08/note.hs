main = putStrLn "Hello, World!" >> putStrLn "Kappa" >> (readLn >>= (\x -> putStrLn (show (x+ 1))))

