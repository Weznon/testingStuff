prompt :: String -> IO String
prompt x = do putStrLn x
              getLine

divisorsList :: (Enum t, Num t, Integral t) => t -> [t]
divisorsList k = [ x | x <- [2..2 * k - 1], k `mod` x  == 0]
main :: IO ()
main = do   a <- prompt "Input number to test"
            let x = divisorsList (read a :: Int)
            let xs = 1 : x
            if null x && (read a :: Int) > 1
            then putStrLn (a ++ " is prime")
            else do putStrLn (a ++ " is not prime and has factors of")
                    print xs
