--This module defines various functions used for parsing the input

module Parser where

import Types



initialStep :: String -> [String]
initialStep x = lines x

makeEvents :: [String] -> [[String]]
makeEvents a = getTilEnd [] a

getTilEnd :: [String] -> [String] -> [[String]]
getTilEnd a (x:[]) = [reverse (x:a)]
getTilEnd a ("END:VEVENT":xs) = reverse ("END:VEVENT":a):(getTilEnd [] xs)
getTilEnd a (x:xs) = getTilEnd (x:a) xs

parseComplete :: String -> [[String]]
parseComplete = makeEvents . initialStep

-- parseCompleteToEvent :: [[String]] -> [Event]
-- parseCompleteToEvent x = map parseToEvent x

-- parseToEvent :: [String] -> Event

-- parseStringToDate :: String -> Date
-- parseStringToDate x = Date (read ([x !! z | z <- [0..3]]), read ([x !! z | z <- [4..5]]), read ([x !! z | z <- [6..7]]))

--make a function that splits along a colon, then use that to determine what the string should be

splitColon :: String -> (String, String)
splitColon s = case dropWhile (== ':') s of
                      "" -> ([], [])
                      s' -> (w,  s'')
                        where (w, s'') = break (== ':') s'
-- map splitColon to the strings, then turn the [String] from splitColon to event parts
-- hard part is parsing the date i think, since the others can just use the second part
-- parseMessyStringToDate :: String -> Date
-- parseMessyStringToDate x =

a :: String
a = "BEGIN:VEVENT\nUID:551b1c72-e8e9-46c2-b2fe-993fa1718c0e\nDTSTART;VALUE=DATE:20161130\nDTEND;VALUE=DATE:20161216\nDTSTAMP:20170113T222923\nSUMMARY:Orchestra - 7769-strings: Live Playthrough\nDESCRIPTION:Prepare the following excerpt from Shostakovich:  Violin 1: &#160;m. 16-38 Violin 2: &#160;m. 18-38 Viola: &#160;m. 18-38 Cello: &#160;m. 31-52 Bass: &#160;m. 30-52  On Thursday, 12/15 and Friday, 12/16, we will have live playthroughs during class. &#160;The exact schedule will be announced shortly. &#160;Ms. Place will hear the violins/violas and Mr. Garcia will hear the cellos/bass.\nEND:VEVENT\nBEGIN:VEVENT\nderp\nEND:VEVENT"



b :: String
b = "A\nQ\nW\nD\nB\nM\nE\nA\nB\nE\nA\ny\nl\ny\nE\nA\nE"


