--Takes an x (disc number), a (initial peg), b (final peg), c (intermediate peg)
hanoi :: Integer -> a -> a -> a -> [(a, a)]
hanoi 0 _ _ _ = []
hanoi n a b c = hanoi (n-1) a c b ++ [(a, b)] ++ hanoi (n-1) c b a
main :: IO()
main = print (hanoi 5 "a" "b" "c")
