--this module defines the various data types used in the calander program
module Types where

data Event = Event {startDate :: Date, endDate :: Date, summary :: String, description :: String}
  deriving (Show, Eq)

data Date = Date {year :: Int, month :: Int, day :: Int}
  deriving (Show, Eq)


