module Main where

data Character = Character {
    charName :: String,
    charLevel :: Int,
    charHealth :: Int,
    charPosition :: (Int, Int)
} deriving (Eq, Show)

data Direction = North | South | East | West deriving (Eq, Show)

move :: Character -> Direction -> Character
move char direction =
    case direction of
        North -> char { charPosition = (x, y + 1) }
        South -> char { charPosition = (x, y - 1) }
        East  -> char { charPosition = (x + 1, y) }
        West  -> char { charPosition = (x - 1, y) }
    where
        (x, y) = charPosition char

mainLoop :: Character -> IO ()
mainLoop char = do
    let (x, y) = charPosition char
    putStrLn $ "You are currently at (" ++ show x ++ ", " ++ show y ++ ")"
    putStrLn "Which way to go? (N/S/E/W)"
    direction <- getLine
    case direction of
        "N" -> mainLoop $ move char North
        "S" -> mainLoop $ move char South
        "E" -> mainLoop $ move char East
        "W" -> mainLoop $ move char West
        "Q" -> putStrLn "Thanks for playing!"
        _   -> do
            putStrLn "Invalid direction"
            mainLoop char

main :: IO ()
main = do
    putStrLn "What is your name?"
    name <- getLine
    mainLoop Character {charName = name, charLevel = 1,
                        charHealth = 10, charPosition = (0, 0)}
