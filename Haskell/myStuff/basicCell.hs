whichRule :: [Int] -> Int
whichRule [a, b, c] = do
                        let sumTest = 2 * a + 3 * b + 4 * c
                        if a == 1
                          then if b == 1
                                  then if c == 1
                                        then 0
                                        else 1
                                  else if c == 1
                                        then 2
                                        else 3
                          else if b == 1
                                  then if c == 1
                                          then 4
                                          else 5
                                  else if c == 1
                                          then 6
                                          else 7
nextCell :: [Int] -> Int
nextCell [a, b, c] = do
                        let rule = whichRule [a, b, c]
                        ruleBinding !! rule
generateNextLine :: [Int] -> [Int]
generateNextLine [c0, c1, c2, c3, c4, c5, c6, c7, c8] = [nextCell [0, c0, c1], nextCell [c0, c1, c2], nextCell [c1, c2, c3], nextCell [c2, c3, c4], nextCell [c3, c4, c5], nextCell [c4, c5, c6], nextCell [c5, c6, c7], nextCell [c6, c7, c8], nextCell [c7, c8, 0]]

ruleBinding :: [Int]
ruleBinding = [0, 1, 1, 0, 1, 1, 1, 0]

main :: IO ()
main = do
          let line0 = [0, 0, 0, 0, 1, 0, 0, 0, 0]
          let line1 = generateNextLine line0
          let line2 = generateNextLine line1
          let line3 = generateNextLine line2
          let line4 = generateNextLine line3
          let line5 = generateNextLine line4
          let line6 = generateNextLine line5
          let line7 = generateNextLine line6
          let line8 = generateNextLine line7
          print line0
          print line1
          print line2
          print line3
          print line4
          print line5
          print line6
          print line7
          print line8
