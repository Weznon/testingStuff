
module LogAnalysis where

import Log

parseMessage :: String -> LogMessage
parseMessage x = let x' = words x in
                 case x' of
                   ("I":ts:msg)     -> LogMessage Info (read ts) (unwords msg)
                   ("W":ts:msg)     -> LogMessage Warning (read ts) (unwords msg)
                   ("E":num:ts:msg) -> LogMessage (Error (read num)) (read ts) (unwords msg)
                   _                -> Unknown (unwords x')

parse :: String -> [LogMessage]
parse x = let x' = lines x in
          [parseMessage (x' !! y) | y <- [0..(length x' - 1)]]
insert :: LogMessage -> MessageTree -> MessageTree
insert (Unknown _) tree = tree
insert msg Leaf = Node Leaf msg Leaf
insert msg1 (Node left msg2 right) = if ts1 > ts2
                                        then Node (insert msg2 left) msg1 right
                                        else Node right msg2 (insert msg1 left)
                                    where
                                        LogMessage _ ts1 _ = msg1
                                        LogMessage _ ts2 _ = msg2
build :: [LogMessage] -> MessageTree
build [] = Leaf
build (x:xs) = insert x (build xs)
inOrder :: MessageTree -> [LogMessage]
inOrder Leaf = []
inOrder (Node left mid right) = inOrder left ++ [mid] ++ inOrder right
