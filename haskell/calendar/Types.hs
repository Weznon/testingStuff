--this module defines the various data types used in the calander program
module Types where

data Event = Event {startDate :: SDate, endDate :: EDate, summary :: Summary, description :: Description}
  deriving (Show, Eq)

data Summary = Summary String
  deriving (Show, Eq)

data SDate = SDate Date
  deriving (Show, Eq)

data EDate = EDate Date
  deriving (Show, Eq)

data Description = Description String
  deriving (Show, Eq)

data Date = Date {year :: Int, month :: Int, day :: Int}
  deriving (Show, Eq)


