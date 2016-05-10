{-# OPTIONS_GHC -Wall #-}
module LogAnalysis where
import Log

parseMessage :: String -> LogMessage
parseMessage x = words
