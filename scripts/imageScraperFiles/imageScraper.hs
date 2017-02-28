import Text.Regex.PCRE
import System.Environment
import System.Directory
import Data.List
import Control.Monad
import Lul

imageRegex :: String
imageRegex = "(?<=<img src=\").*?(?=\")"

nameRegex :: String
nameRegex = "(?<=<h3>).*?(?=<\\/h3>)"

sourceFile :: IO String
sourceFile = getCurrentDirectory >>= (\z -> return (z ++ "/source")) >>= readFile

resultFile :: IO FilePath
resultFile = getCurrentDirectory >>= (\z -> return (z ++ "/curl.sh"))

names :: IO [String]
names = sourceFile >>= (\z -> return (getAllTextMatches (z =~ nameRegex :: AllTextMatches [] String))) >>= (\z1 -> return (map (\y -> (filter (\w -> not (w == '\''))) y) z1))

images :: IO [String]
images = sourceFile >>= (\z -> return (getAllTextMatches (z =~ imageRegex :: AllTextMatches [] String))) >>= (\z1 -> mapM (\z2 -> return ("https:" ++ z2)) z1) >>= (\z -> return (map (\g -> replace "thumb" "large" g) z))

bashLine :: String -> String -> IO String
bashLine name url = return ("`curl \"" ++ url ++ "\" > \"" ++ name ++ ".png\"`")

commands :: IO [String]
commands = do
              x <- names
              y <- images
              zipWithM (bashLine) x y


main :: IO()
main = do
        filep <- resultFile
        writeFile filep "#!/bin/bash\n"
        commands >>= (\z -> mapM_ (\x -> appendFile filep (x ++ "\n")) z)
