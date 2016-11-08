--parseDie :: String -> Maybe (Int, Int)
--parseDie = (read

splitD :: String -> [String]
splitD [] = []
splitD (x:[]) = if (x == 'd') then [] else [x:[]]
splitD (x:y:[]) = if (x == 'd') then (splitD (y:[])) else [x:[]]
splitD (x:y:xs) = if (y == 'd') then ([x:[]] ++ (splitD xs)) else (splitD (y:xs))
