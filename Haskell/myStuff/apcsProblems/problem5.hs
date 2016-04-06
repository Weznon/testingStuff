prompt :: IO ()
prompt x = do putStrLn x
              readLn
isPrime 2 = 0
isPrime x = do let y = sqrt x
                    if y `mod` x == 0
                    then return False
                    else isPrime x - 1
