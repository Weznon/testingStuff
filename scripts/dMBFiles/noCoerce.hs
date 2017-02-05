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

data Flag = Help | Direct String | Default String | NoArgs | DirectMiss
  deriving (Show, Eq)

flagger :: [String] -> IO Flag
flagger []             = return NoArgs
flagger ("-d":[])      = return DirectMiss
flagger ("-d":dest:xs) = return (Direct dest)
flagger ("-h":xs)      = return Help
flagger ("-l":[])      = return DirectMiss
flagger ("-l":x:xs)    = return (Default x)
flagger (x:xs)         = if ((head x) == '-') then return(Help) else return (Default x)

useFlag :: Flag -> IO String
useFlag Help       = return help
useFlag DirectMiss = return help
useFlag NoArgs     = return help
useFlag (Direct x)   = search x
useFlag (Default x)  = getCurrentDirectory >>= (\z -> return (z ++ "/" ++ x)) >>= (\u -> search u)

search :: String -> IO String
search x = doesFileExist x >>= (\z -> if (not z) then return ("File Does Not Exist\n") else return "asd")

--replace "asd" in else with actual code
--its the one that searcheds the file for regex
--might call another function? might be easier then writing in on one line, it is kinda complicated iirc

help :: String
help = "Usage: detectMissingBreaks [OPTION] [FILE]\nSearches for missing break statements in currentDirectory/[FILE]\nOptions:\n  -d    Provide direct link to file (/home/weznon/.bashrc) instead of appending [FILE] to current directory\n  -h    Prints this help message\n  -l    Uses currentDirectory/[FILE], use when the file starts with \"-\""

-- needs to be able to pass Nulp through it all, to account for a missing argument
-- needs some form of error handling
-- which would be noargs
-- nulp is just no flag, which means to just



          -- print (show (length matches) ++ " matches found")
          -- mapM_ (\x -> putStrLn ("Missing a Break!\n" ++ x ++ "\n--------------------\n")) matches
-- some links
-- https://hackage.haskell.org/package/directory-1.3.0.1/docs/System-Directory.html
-- http://hackage.haskell.org/package/base-4.9.1.0/docs/System-Environment.html#v:getArgs
-- https://hackage.haskell.org/package/directory-1.3.0.1/docs/System-Directory.html
-- http://hackage.haskell.org/package/base-4.9.1.0/docs/Prelude.html#t:FilePath
-- http://gabebw.com/blog/2015/10/11/regular-expressions-in-haskell
-- https://regex101.com/r/0AqHNQ/15
