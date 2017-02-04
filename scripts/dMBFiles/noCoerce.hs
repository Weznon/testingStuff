import Text.Regex.PCRE
import System.Environment
import System.Directory
import System.IO.Unsafe
--This haskell script auto detects when a java program is missing case statements
--It will provide the complete match
--Takes a command line argument of the file, starting from the running directory
--the optional argument -l will make it a link starting from / directory

--The regex used to search for it

-- this is really bad
-- just look at the imports, unsafePerformIO
-- it works though
-- except on the final case
-- then it will just output the case number
-- but at least its something
-- itll do


regex :: String
regex = "((case [0-9]*:)(?!(.*\\n(?!\\s*?case))*?(?!\\s*?case)\\s*break;(.*\\n)*?\\s*case)(.*\\n)*?\\s*(?=case [0-9]*:)|(case [0-9]*:(?!(.*\\n(?!\\s*?case))*?(?!\\s*?case)\\s*break;(.*\\n)*?\\s*$)))"

whoK :: IO String
whoK =  readFile "/home/weznon/programming/git/scripts/test"

args :: IO [String]
args = getArgs

file :: IO String
file = if (head args == "-l") then (args >> = (\x -> return (x !! 1)) else (getCurrentDirectory >>=  ++ "/" ++ (args !! 0))

-- getting this to be nice is annyoing
-- look at the types and stuff to figure it out
-- cancer

fileContents :: IO String
fileContents = readFile file

matches :: [String]
matches = getAllTextMatches (fileContents =~ regex :: AllTextMatches [] String)

main :: IO()
main = results >>= (\x -> putStrLn x)
          -- return
          -- print (if (length args == 0) then "No arguments detected; will crash" else "reading: " ++ file)
          -- print (show (length matches) ++ " matches found")
          -- mapM_ (\x -> putStrLn ("Missing a Break!\n" ++ x ++ "\n--------------------\n")) matches
-- some links
-- https://hackage.haskell.org/package/directory-1.3.0.1/docs/System-Directory.html
-- http://hackage.haskell.org/package/base-4.9.1.0/docs/System-Environment.html#v:getArgs
-- https://hackage.haskell.org/package/directory-1.3.0.1/docs/System-Directory.html
-- http://hackage.haskell.org/package/base-4.9.1.0/docs/Prelude.html#t:FilePath
-- http://gabebw.com/blog/2015/10/11/regular-expressions-in-haskell
-- https://regex101.com/r/0AqHNQ/15
