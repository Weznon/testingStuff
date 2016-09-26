prompt :: String -> IO String
prompt x = do putStrLn x
              getLine

isPrime :: (Enum t, Num t, Integral t, Enum a, Num a, Integral a) => a -> Bool
isPrime k = null [ x | x <- [2..floor(sqrt (fromIntegral k))], k `mod` x  == 0]

main :: IO ()
main = do   a <- prompt "Input number to test"
            if isPrime (read a :: Int) && (read a :: Int) > 1
            then putStrLn (a ++ " is prime")
            else putStrLn (a ++ " is not prime")
