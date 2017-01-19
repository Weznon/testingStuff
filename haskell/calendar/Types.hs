--this module defines the various data types used in the calander program
module Types where

data Event = Event {startDate :: SubEvent, endDate :: SubEvent, summary :: SubEvent, description :: SubEvent}
  deriving (Show, Eq)

data SubEvent = Summary String | SDate Date | EDate Date | Desc String | Nulp
  deriving (Show, Eq)

data Date = Date {year :: Int, month :: Int, day :: Int}
  deriving (Show, Eq)


