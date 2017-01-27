--this module defines the various data types used in the calander program
module Types where

data Event = Event {startDate :: SubEvent, endDate :: SubEvent, summary :: SubEvent, description :: SubEvent}
  deriving (Eq)

instance Show Event where
  show (Event sd ed summ desc) = (show sd) ++ ", " ++ (show ed) ++ ", " ++ (show summ) ++ ", " ++ (show desc) ++ "\n"

data SubEvent = Summary String | SDate Date | EDate Date | Desc String | Nulp
  deriving (Eq)

instance Show SubEvent where
  show (Summary a) = "Summary: " ++ a
  show (SDate a)   = "Start Date: " ++ show a
  show (EDate a)   = "End Date: " ++ show a
  show (Desc a)    = "Description: " ++ a
  show (Nulp)      = "Nulp"


data Date = Date {year :: Int, month :: Int, day :: Int}
  deriving ( Eq)

instance Show Date where
  show (Date y m d) = (show m) ++ "/" ++ (show d) ++ "/" ++ (show y)
