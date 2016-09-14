data Tree a = Leaf
            | Node Integer (Tree a) a (Tree a)
            deriving (Show, Eq)

foldTree :: [a] -> Tree a
foldTree    = foldr insertNode Leaf

insertNode :: a -> Tree a -> Tree a
insertNode x Leaf = (Node 0 Leaf x Leaf)
insertNode x (Node h lt a rt)
            | treeHeight lt < treeHeight rt =
                let nt = insertNode x lt
                in (Node (treeHeight nt + 1) nt a rt)
            | otherwise                     =
                let nt = insertNode x rt
                in (Node (treeHeight nt + 1) lt a nt)
treeHeight :: Tree a -> Integer
treeHeight Leaf             = -1
treeHeight (Node h _ _ _)   = h
