

whichRule :: [Int] -> Int
whichRule [a, b, c] = do
                        let sumTest = 2 * a + 3 * b + 4 * c
                        if sumTest == 9
                          then 0
                        else if sumTest == 5
                          then 1
                        else if sumTest == 6
                          then 2
                        else if sumTest == 2
                          then 3
                        else if sumTest == 7
                          then 4
                        else if sumTest == 3
                          then 5
                        else if sumTest == 4
                          then 6
                        else if sumTest == 0
                          then 7
                        else error "something didn't sum up, probably means you fed non-binary thing"
nextCell :: [Int] -> Int
nextCell [a, b, c] = do
                        let rule = whichRule [a, b, c]
                        ruleBinding !! rule
ruleBinding :: [Int]
ruleBinding = [0, 1, 1, 0, 1, 1, 1, 0]
