--Excersize 1, Hopscotch
skips :: [a] -> [[a]]
skips x = [[x !! z | z <- [y-1, 2*y-1..(length x)-1]] | y <- [1..(length x)]]

--Excersize 2, Local Maxima
localMaxima :: [Integer] -> [Integer]
localMaxima (x:y:z:xs) = if (y > x && y > z) then [y] ++ localMaxima ([y] ++ [z] ++ xs) else localMaxima ([y] ++ [z] ++ xs)
localMaxima x = []

--Excersize 3, Histogram
--ayy takes a lsomist of integers and produces a list that says how many of each there are

histogram :: [Int] -> String
histogram x = (stringer (map parse (binaryifier maxed quan))) ++ "==========\n0123456789"
                where quan = quantity x
                      maxed = maximum quan

quantity :: [Int] -> [Int]
quantity x = [length (filter (\z -> z == y) x) | y <- [0..9]]

binaryifierHelp :: Int -> Int -> Int
binaryifierHelp x y = if x <= y then 1 else 0

binaryifier :: Int -> [Int] -> [[Int]]
binaryifier 0 x = []
binaryifier max' x = map (binaryifierHelp max') x : binaryifier (max'-1) x


parse :: [Int] -> String
parse (0:xs) = " " ++ parse xs
parse (1:xs) = "*" ++ parse xs
parse x = ""

stringer :: [String] -> String
stringer (x:xs) = x ++ "\n" ++ stringer xs
stringer x = ""
