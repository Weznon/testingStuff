xor :: [Bool] -> Bool
xor = foldr xorA False

xorA :: Bool -> Bool -> Bool
xorA a b = (a || b) && (not (a && b))

map' :: (a -> b) -> [a] -> [b]
map' f = foldr (\x y -> (f x):(y)) []
