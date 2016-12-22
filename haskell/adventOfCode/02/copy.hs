import Control.Applicative

type Button = Int
type Direction = Char

moveOnce :: Button -> Direction -> Button
moveOnce button 'D' = min (button+3) (6 + (mod button 3))
moveOnce button 'U' = max (button-3) (mod button 3)
moveOnce button 'R' = min (button - (mod button 3) + 2) (button+1)
moveOnce button 'L' = max (button - (mod button 3)) (button-1)

findNextButton :: Button -> [Direction] -> Button
findNextButton button moves = foldl moveOnce button moves

main = do
    xs <- lines <$> readFile "input"
    print $ tail . reverse . map (+1) $ foldl (\(cur:prev) moves -> (findNextButton cur moves) : cur : prev) [4] xs
