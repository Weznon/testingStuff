{- This File likely contains tons of werid-ass functions, whoose uses may not seem clear. This is simply just a sandbox for random shit that doesn't fit else where-}
--front22, from http://codingbat.com/prob/p183592
front22 :: String -> String
front22 [] = []
front22 [x1] = [x1] ++ [x1] ++ [x1]
front22 orig@(x1:(x2:xs)) = [x1] ++ [x2] ++ orig ++ [x1] ++ [x2]
--Left Riemann Sum Calculator with integral inputs
--leftSum :: Int -> Int -> Int

data Peg = Red | Green | Blue | Yellow | Orange | Purple
         deriving (Show, Eq, Ord)

isA :: Peg -> Peg-> Bool
isA x y = x == y
x :: Peg
x = Red
y :: Peg
y = Green
z :: Peg
z = Red

--Convert to binary
conBin :: Integer -> Integer
conBin x = read (conv x)
        where conv x = (if (x `div` 2 == 0) then [] else conv (x `div` 2)) ++ (show (x `rem` 2))
