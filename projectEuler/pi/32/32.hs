import Data.List

combinations :: Int -> [a] -> [[a]]
combinations 0 _ = [[]]
combinations _ [] = []
combinations n xs@(y:ys)
  | n < 0     = []
  | otherwise = case drop (n-1) xs of
                  [ ] -> []
                  [_] -> [xs]
                  _   -> [y:c | c <- combinations (n-1) ys] ++ combinations n ys

generate :: [[Int]]
generate = foldl' (++) [] (permutations combo)
  where combo = combinations 5 [1,2,3,4,5,6,7,8,9]

main :: IO()
main = print $ length $ generate
