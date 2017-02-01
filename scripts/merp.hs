import Text.Regex.PCRE
import System.Environment
import System.Directory
import System.IO.Unsafe
--This haskell script auto detects when a java program is missing case statements
--It will provide the complete match
--Takes a command line argument of the file, starting from the running directory
--the optional argument -l will make it a link starting from / directory

--The regex used to search for it
regex :: String
regex = "(case [0-9]*:)(?!(.*\\n(?!\\s*?case))*?(?!\\s*?case)\\s*break;(.*\\n)*?\\s*case)(.*\\n)*?\\s*(?=case [0-9]*:)"

whoK :: IO String
whoK =  readFile "/home/weznon/programming/git/scripts/test"

main :: IO()
main = do
          d <- readFile "/home/weznon/programming/git/scripts/test"
          -- print (d)
          let w = d =~ regex :: AllTextMatches [] String
          print "------------------"
          -- print "\n"
          print (getAllTextMatches w)
          let a = getCurrentDirectory
          print (unsafePerformIO a)

-- some links
-- https://hackage.haskell.org/package/directory-1.3.0.1/docs/System-Directory.html
-- http://hackage.haskell.org/package/base-4.9.1.0/docs/System-Environment.html#v:getArgs
-- https://hackage.haskell.org/package/directory-1.3.0.1/docs/System-Directory.html
-- http://hackage.haskell.org/package/base-4.9.1.0/docs/Prelude.html#t:FilePath
-- http://gabebw.com/blog/2015/10/11/regular-expressions-in-haskell
-- https://regex101.com/r/0AqHNQ/15
