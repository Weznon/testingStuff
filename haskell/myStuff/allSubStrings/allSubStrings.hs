allSubStrings :: String -> [String]
allSubStrings [] = []
allSubStrings x = (allStrings x) ++ (allSubStrings (tail x))
                where allStrings x = [[x !! n | n <- [0..z]] | z <- [0..(length x - 1)]]
