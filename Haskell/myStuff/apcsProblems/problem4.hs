slope :: (Num a, Fractional a) => [(a, a)] -> a
slope [(x1, y1), (x2, y2)] = (y2 - y1)/(x2 - x1)
intercept :: (Num a, Fractional a) => [(a, a)] -> a
intercept [(x1, y1), (x2, y2)] = y2 - slope [(x1, y1), (x2, y2)] * x2
prompt :: String -> IO String
prompt x = do putStrLn x
              getLine
main :: IO ()
main = do x1 <- prompt "x1"
          y1 <- prompt "y1"
          x2 <- prompt "x2"
          y2 <- prompt "y2"
          print $ slope [(read x1 :: Float, read y1 :: Float), (read x2 :: Float, read y2 :: Float)]
          print $ intercept [(read x1 :: Float, read y1 :: Float), (read x2 :: Float, read y2 :: Float)]
