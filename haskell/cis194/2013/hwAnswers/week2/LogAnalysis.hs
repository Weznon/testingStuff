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
insert x y  = 
