{- This File likely contains tons of werid-ass functions, whoose uses may not seem clear. This is simply just a sandbox for random shit that doesn't fit else where-}
--front22, from http://codingbat.com/prob/p183592
front22 :: String -> String
front22 [] = []
front22 [x1] = [x1] ++ [x1] ++ [x1]
front22 orig@(x1:(x2:xs)) = [x1] ++ [x2] ++ orig ++ [x1] ++ [y2]
--Left Riemann Sum Calculator with integral inputs
leftSum :: Int -> Int -> Int
