type Peg = String
type Move = (Peg, Peg)

hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 1 so sp de = [(so, sp)]
hanoi n so sp de = hanoi (n-1) so sp de ++ [(so, sp)] ++ hanoi (n-1) de sp so
