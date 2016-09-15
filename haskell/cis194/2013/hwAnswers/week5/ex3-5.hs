--Excersize 3
data Stream a = Cons a (Stream a)
    deriving (Eq, Read)

instance Show a => Show (Stream a) where
        show x = show (take 20 (streamToList x))

streamToList :: Stream a -> [a]
streamToList (Cons a b) = a:streamToList(b)

--Excersize 4
streamRepeat :: a -> Stream a
streamRepeat a = (Cons a (streamRepeat a))

streamMap :: (a -> b) -> Stream a -> Stream b
streamMap f (Cons a b) = (Cons (f a) (streamMap f b))

streamFromSeed :: (a -> a) -> a -> Stream a
streamFromSeed f a = (Cons a (streamFromSeed f (f a)))

--Excersize 5
nats :: Stream Integer
nats = streamFromSeed (+1) 0

ruler :: Stream Integer
ruler = streamMap rulerGen s0
    where   s0 = streamFromSeed (+1) 1
            rulerGen n | odd n = 0 | otherwise = 1 + rulerGen (n `div` 2)

streamInterweave :: Stream a -> Stream a -> Stream a
streamInterweave (Cons a b) e = (Cons a (streamInterweave e b))
