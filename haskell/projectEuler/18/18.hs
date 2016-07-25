row1 :: [Int]
row1 = [75]

row2 :: [Int]
row2 = [95, 64]

row3 :: [Int]
row3 = [17, 47, 82]

row4:: [Int]
row4 = [18, 35, 87, 10]

row5 :: [Int]
row5 = [20, 04, 82, 47, 65]

row6 :: [Int]
row6 = [19, 01, 23, 75, 03, 34]

row7 :: [Int]
row7 = [88, 02, 77, 73, 07, 63, 67]

row8 :: [Int]
row8 = [99, 65, 04, 28, 06, 16, 70, 92]

row9 :: [Int]
row9 = [41, 41, 26, 56, 83, 40, 80, 70, 33]

row10 :: [Int]
row10 = [41, 48, 72, 33, 47, 32, 37, 16, 94, 29]

row11 :: [Int]
row11 = [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14]

row12 :: [Int]
row12 = [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57]

row13 :: [Int]
row13 = [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48]

row14 :: [Int]
row14 = [63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31]

row15 :: [Int]
row15 = [04, 62, 98, 27, 23, 09, 70, 98, 73, 93, 38, 53, 60, 04, 23]

turnTuple :: [Int] -> [(Int, Int)]
turnTuple x = [(x !! y, x !! (y+1)) | y <- [0..(length x - 2)]]

takeMaxTuple :: (Int, Int) -> Int
takeMaxTuple x = if fst x > snd x then fst x else snd x

takeMax :: [(Int, Int)] -> [Int]
takeMax = map takeMaxTuple

sumShit :: [Int] -> [Int] -> [Int]
sumShit x y = [(x !! z) + (y !! z) | z <- [0..(length x - 1)]]

crate :: [Int] -> [Int] -> [Int]
crate x y = sumShit (takeMax (turnTuple y)) x

calculateShit :: [Int]
calculateShit = crate row1 (crate row2 (crate row3 (crate row4 (crate row5 (crate row6 (crate row7 (crate row8 (crate row9 (crate row10 (crate row11 (crate row12 (crate row13 (crate row14 row15)))))))))))))

main :: IO()
main = print calculateShit
