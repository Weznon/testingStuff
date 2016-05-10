
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
