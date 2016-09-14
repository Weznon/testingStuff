data Stream a = Cons a (Stream a)
    deriving (Eq, Read)

instance Show a => Show (Stream a) where
        show = take 20 streamToList

streamToList :: Stream a -> [a]
streamToList (Cons a b) = a:streamToList(b)
