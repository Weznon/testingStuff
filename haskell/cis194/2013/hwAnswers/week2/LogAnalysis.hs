{-# OPTIONS_GHC -Wall #-}
module LogAnalysis where

import Log
--Excersize 1
parseMessage :: String -> LogMessage
parseMessage ('I':x) = LogMessage Info (read (m !! 0)) ((unwords [m !! y | y <- [1..(length m)-1]]))
                        where m = words x
parseMessage ('W':x) = LogMessage Warning (read (m !! 0)) ((unwords [m !! y | y <- [1..(length m)-1]]))
                        where m = words x
parseMessage ('E':x) = LogMessage (Error (read (m !! 0))) (read (m !! 1)) ((unwords [m !! y | y <- [2..(length m)-1]]))
                        where m = words x
parseMessage x = Unknown x

parse :: String -> [LogMessage]
parse x = map parseMessage (lines x)

--Excersize 2
insert :: LogMessage -> MessageTree -> MessageTree
insert (Unknown _) x  = x
insert x Leaf = Node Leaf x Leaf
insert m1@(LogMessage _ ts1 _) (Node left m2@(LogMessage _ ts2 _) right)
        |ts1 > ts2 = Node left m2 (insert m1 right)
        |otherwise = Node (insert m2 left) m1 right

--Excersize 3
build :: [LogMessage] -> MessageTree
build x = push x Leaf
                where push (x:xs) tree = push xs (insert x tree)
                      push [] tree = tree

--Excersize 4
inOrder :: MessageTree -> [LogMessage]
inOrder Leaf = []
inOrder (Node left x right) = (inOrder left) ++ [x] ++ (inOrder right)

--Excersize 5
whatWentWrong :: [LogMessage] -> [String]
whatWentWrong msgs = map extract $ filter fifty (inOrder $ build msgs)
                        where extract (LogMessage _ _ x) = x
                              fifty (LogMessage (Error num) _ _) = num >= 50
                              fifty _ = False
