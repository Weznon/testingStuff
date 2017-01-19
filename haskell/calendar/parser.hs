--This module defines various functions used for parsing the input

module Parser where

import Types



initialStep :: String -> [String]
initialStep x = lines x

makeEvents :: [String] -> [[String]]
makeEvents a = getTilEnd [] a

getTilEnd :: [String] -> [String] -> [[String]]
getTilEnd a (x:[])            = [reverse (x:a)]
getTilEnd a ("END:VEVENT":xs) = reverse ("END:VEVENT":a):(getTilEnd [] xs)
getTilEnd a (x:xs)            = getTilEnd (x:a) xs

parseComplete :: String -> [[String]]
parseComplete = makeEvents . initialStep

parseCompleteToEvent :: [[String]] -> [Event]
parseCompleteToEvent x = map (\z -> subEventToEvent (parseToEvent (map (splitColon) z))) x

subEventToEvent :: [SubEvent] -> Event
subEventToEvent (a:b:c:d:[]) = Event a b c d
subEventToEvent _ = Event Nulp Nulp Nulp Nulp

parseToEvent :: [(String, String)] -> [SubEvent]
parseToEvent ([])                           = []
parseToEvent (("DTSTART;VALUE=DATE", x):xs) = (toSDate x):(parseToEvent xs)
parseToEvent (("DTEND;VALUE=DATE", x):xs)   = (toEDate x):(parseToEvent xs)
parseToEvent (("SUMMARY", x):xs)            = (toSummary x):(parseToEvent xs)
parseToEvent (("DESCRIPTION", x):xs)        = (toDescription x):(parseToEvent xs)
parseToEvent (_:xs)                         = parseToEvent xs

stringToDate :: String -> Date
stringToDate x  = Date year month day
  where year    = read ([x !! z | z <- [1..4]])
        month   = read ([x !! z | z <- [5..6]])
        day     = read ([x !! z | z <- [7..8]])

toSummary :: String -> SubEvent
toSummary x = Summary x

toDescription :: String -> SubEvent
toDescription x = Desc x

toSDate :: String -> SubEvent
toSDate x = SDate (stringToDate x)

toEDate :: String -> SubEvent
toEDate x = EDate (stringToDate x)

splitColon :: String -> (String, String)
splitColon s = case dropWhile (== ':') s of
                      "" -> ([], [])
                      s' -> (w,  s'')
                        where (w, s'') = break (== ':') s'
-- map splitColon to the strings, then turn the [String] from splitColon to event parts
-- hard part is parsing the date i think, since the others can just use the second part
-- parseMessyStringToDate :: String -> Date
-- parseMessyStringToDate x =
c :: String
c = "BEGIN:VEVENT\nUID:532782dc-a0f0-49c0-9855-9c81c834c077\nDTSTART;VALUE=DATE:20160930\nDTEND;VALUE=DATE:20161014\nDTSTAMP:20170118T210734\nSUMMARY:Orchestra - 7769-strings: Playthrough #1\nDESCRIPTION:Please record the excerpts listed on the document to the best of your ability. &#160;You are graded on tone, rhythm, fingerings, phrasing, and dynamics. &#160;Upload each excerpt into your US orchestra class view folder. &#160;Once they are uploaded, please rename the files by piece (example: &#160;Huapango). &#160;  If you do not know how to upload files into your class view folder, we will learn about this in class on Wednesday, October 5. &#160;\nSTATUS:CONFIRMED\nCLASS:PUBLIC\nPRIORITY:3\nCATEGORIES:podium,events\nEND:VEVENT\n\nBEGIN:VEVENT\nUID:e7182f17-e29b-4537-982a-56bd33b63275\nDTSTART;VALUE=DATE:20161130\nDTEND;VALUE=DATE:20161216\nDTSTAMP:20170118T210734\nSUMMARY:Orchestra - 7769-strings: Live Playthrough\nDESCRIPTION:Prepare the following excerpt from Shostakovich:  Violin 1: &#160;m. 16-38 Violin 2: &#160;m. 18-38 Viola: &#160;m. 18-38 Cello: &#160;m. 31-52 Bass: &#160;m. 30-52  On Thursday, 12/15 and Friday, 12/16, we will have live playthroughs during class. &#160;The exact schedule will be announced shortly. &#160;Ms. Place will hear the violins/violas and Mr. Garcia will hear the cellos/bass.\nSTATUS:CONFIRMED\nCLASS:PUBLIC\nPRIORITY:3\nCATEGORIES:podium,events\nEND:VEVENT\n\nBEGIN:VEVENT\nUID:423bb19b-78c3-403f-ba2b-aa20c21d0524\nDTSTART;VALUE=DATE:20161130\nDTEND;VALUE=DATE:20161216\nDTSTAMP:20170118T210734\nSUMMARY:Orchestra - 7769-strings: Live Playthrough\nDESCRIPTION:Prepare the following excerpt from Shostakovich:  Violin 1: &#160;m. 16-38 Violin 2: &#160;m. 18-38 Viola: &#160;m. 18-38 Cello: &#160;m. 31-52 Bass: &#160;m. 30-52  On Thursday, 12/15 and Friday, 12/16, we will have live playthroughs during class. &#160;The exact schedule will be announced shortly. &#160;Ms. Place will hear the violins/violas and Mr. Garcia will hear the cellos/bass.\nSTATUS:CONFIRMED\nCLASS:PUBLIC\nPRIORITY:3\nCATEGORIES:podium,events\nEND:VEVENT\n\nBEGIN:VEVENT\nUID:51b115bd-c1e4-4d51-9a9d-47a478f0abfd\nDTSTART;VALUE=DATE:20170118\nDTEND;VALUE=DATE:20170203\nDTSTAMP:20170118T210734\nSUMMARY:Orchestra - 7769-strings: Playthrough #3\nDESCRIPTION:This playthrough will take place 'live' during class. &#160;Individual time slots will be posted no later than Wednesday, February 1. &#160;You will be graded on: correct notes intonation rhythm dynamics and character.\nSTATUS:CONFIRMED\nCLASS:PUBLIC\nPRIORITY:3\nCATEGORIES:podium,events\nEND:VEVENT\n\nBEGIN:VEVENT\nUID:dba55327-8ebd-4dc0-a63c-a71edc66e4a8\nDTSTART;VALUE=DATE:20170118\nDTEND;VALUE=DATE:20170203\nDTSTAMP:20170118T210734\nSUMMARY:Orchestra - 7769-strings: Playthrough #3\nDESCRIPTION:This playthrough will take place 'live' during class. &#160;Individual time slots will be posted no later than Wednesday, February 1. &#160;You will be graded on: correct notes intonation rhythm dynamics and character.\nSTATUS:CONFIRMED\nCLASS:PUBLIC\nPRIORITY:3\nCATEGORIES:podium,events\nEND:VEVENT\nEND:VCALENDAR"
a :: String
a = "BEGIN:VEVENT\nUID:551b1c72-e8e9-46c2-b2fe-993fa1718c0e\nDTSTART;VALUE=DATE:20161130\nDTEND;VALUE=DATE:20161216\nDTSTAMP:20170113T222923\nSUMMARY:Orchestra - 7769-strings: Live Playthrough\nDESCRIPTION:Prepare the following excerpt from Shostakovich:  Violin 1: &#160;m. 16-38 Violin 2: &#160;m. 18-38 Viola: &#160;m. 18-38 Cello: &#160;m. 31-52 Bass: &#160;m. 30-52  On Thursday, 12/15 and Friday, 12/16, we will have live playthroughs during class. &#160;The exact schedule will be announced shortly. &#160;Ms. Place will hear the violins/violas and Mr. Garcia will hear the cellos/bass.\nEND:VEVENT\nBEGIN:VEVENT\nderp\nEND:VEVENT"



b :: String
b = "A\nQ\nW\nD\nB\nM\nE\nA\nB\nE\nA\ny\nl\ny\nE\nA\nE"


