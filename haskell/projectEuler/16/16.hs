num :: Integer
num = 2 ^ 1000

digs :: Integral x => x -> [x]
digs 0 = []
digs x = digs (x `div` 10) ++ [x `mod` 10]

main :: IO()
main = print (sum (digs num))
