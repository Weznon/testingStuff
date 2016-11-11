{- CIS 194 HW 10
   due Monday, 1 April
-}

module AParser where

import           Control.Applicative

import           Data.Char

-- A parser for a value of type a is a function which takes a String
-- represnting the input to be parsed, and succeeds or fails; if it
-- succeeds, it returns the parsed value along with the remainder of
-- the input.
newtype Parser a = Parser { runParser :: String -> Maybe (a, String) }

-- For example, 'satisfy' takes a predicate on Char, and constructs a
-- parser which succeeds only if it sees a Char that satisfies the
-- predicate (which it then returns).  If it encounters a Char that
-- does not satisfy the predicate (or an empty input), it fails.
satisfy :: (Char -> Bool) -> Parser Char
satisfy p = Parser f
  where
    f [] = Nothing    -- fail on the empty input
    f (x:xs)          -- check if x satisfies the predicate
                        -- if so, return x along with the remainder
                        -- of the input (that is, xs)
        | p x       = Just (x, xs)
        | otherwise = Nothing  -- otherwise, fail

-- Using satisfy, we can define the parser 'char c' which expects to
-- see exactly the character c, and fails otherwise.
char :: Char -> Parser Char
char c = satisfy (== c)

{- For example:

*Parser> runParser (satisfy isUpper) "ABC"
Just ('A',"BC")
*Parser> runParser (satisfy isUpper) "abc"
Nothing
*Parser> runParser (char 'x') "xyz"
Just ('x',"yz")

-}

-- For convenience, we've also provided a parser for positive
-- integers.
posInt :: Parser Integer
posInt = Parser f
  where
    f xs
      | null ns   = Nothing
      | otherwise = Just (read ns, rest)
      where (ns, rest) = span isDigit xs

------------------------------------------------------------
-- Your code goes below here
------------------------------------------------------------
--1

instance Functor Parser where
  fmap f p1 = (Parser (\x -> (first f) <$> (runParser p1 x)))
--this is because a is a function. so when its being used its treated as a Maybe (a, String) fmap here is being used in reference to a Maybe functor, not Parser functor. from the function composition the type remains the same
--basically the types are really weird.like really weird
--(fmap (first f) . a) is like String -> (Maybe (a, String) -> (a -> b) -> f b)
--the maybe is chained into the next thing, and then uses fmap on a maybe to apply the function
first :: (a -> b) -> (a, c) -> (b, c)
first f (a, c) = (f a, c)

--2

instance Applicative Parser where
  pure a  = Parser (\x -> Just (a, x))
  --Take the a, put it into the Just with an input string
  p1 <*> p2 = Parser f
    where f str = case runParser p1 str of
                    Nothing -> Nothing
                    Just (fRes, sRes) -> first fRes <$> runParser p2 sRes
--3
abParser :: Parser (Char, Char)
abParser =
