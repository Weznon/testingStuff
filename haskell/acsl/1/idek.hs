import Data.Char

charToValue :: Char -> Int
charToValue 'a' = 1
charToValue 'b' = 2
charToValue 'c' = 3
charToValue 'd' = 4
charToValue 'e' = 5
charToValue 'f' = 6
charToValue 'g' = 7
charToValue 'h' = 8
charToValue 'i' = 9
charToValue 'j' = 10
charToValue 'k' = 11
charToValue 'l' = 12
charToValue 'm' = 13
charToValue 'n' = 14
charToValue 'o' = 15
charToValue 'p' = 16
charToValue 'q' = 17
charToValue 'r' = 18
charToValue 's' = 19
charToValue 't' = 20
charToValue 'u' = 21
charToValue 'v' = 22
charToValue 'w' = 23
charToValue 'x' = 24
charToValue 'y' = 25
charToValue 'z' = 26
charToValue  x  = 0

alphabet :: [String]
alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

valueToChar :: Int -> String
valueToChar x = alphabet !! ((x) `mod` 26)

primes :: [Int]
primes = [2,3,5,7,11,13,17,19,23]

primeFactor :: Int -> [Int]
primeFactor 1 = []
primeFactor x = [a] ++ primeFactor (x `div` a)
  where a = head (filter (\y -> (x `mod` y == 0)) primes)

flattenFactors :: Int -> [Int] -> Int
flattenFactors _ [] = 0
flattenFactors x (y:ys) | x == y = 1+(flattenFactors x ys)
                        | otherwise = flattenFactors x ys

sumFactors :: [Int] -> Int
sumFactors x =  product $ map tupleToInt [(z, flattenFactors z x) | z <- primes]

tupleToInt :: (Int, Int) -> Int
tupleToInt x = sum [(fst x) ^ z | z <- [0..(snd x)]]

sumF :: Int -> Int
sumF  = sumFactors . primeFactor
-- Above are messy, but they work
-- could almost certainly ne more efficient

iOne :: Int -> Int
iOne = (* 2)

iTwo :: Int -> Int
iTwo x = (5 * (x `mod` 3))

iThr :: Int -> Int
iThr x = ((-8) * (x `div` 4))

iFou ::  Int -> Int
iFou = ((-12) *) . fromIntegral . toInteger . floor . realToFrac . sqrt . fromIntegral

iFiv :: Int -> Int
iFiv = (10 *) . sumF

eval :: (Char, Int) -> Int
eval (x, 1) = iOne $ charToValue x
eval (x, 2) = iTwo $ charToValue x
eval (x, 3) = iThr $ charToValue x
eval (x, 4) = iFou $ charToValue x
eval (x, 5) = iFiv $ charToValue x
eval _      = error "error parsing. You likely have a char where there should be an int"

--Should only be called with Strings of length two, since its will throw out the rest, throw an error if not
parse :: String -> (Char, Int)
parse x = (toLower $ fst (y !! 0) , digitToInt (fst(z !! 0)))
        where y = readLitChar x
              z = readLitChar (snd (y !! 0))

split :: String -> [String]
split [] = []
split (x:[]) = []
split (x:y:xs) = [([x] ++[y])] ++ split xs

stringToInt :: String -> [Int]
stringToInt = map (\x -> eval $ parse $ x) . split

--Int is the value of the starting character, or A
process :: Int -> [Int] -> [Int]
process x [] = []
process x xs = [f] ++ process (f `mod` 26) (tail xs)
  where f = x + head xs

backToString :: [Int] -> String
backToString x = foldr (++) "" ( map (valueToChar) f)
  where f = process 0 x

evalString :: String -> String
evalString  = backToString . stringToInt

main :: IO()
main = do
        putStrLn "Enter String"
        name <- getLine
        putStrLn $ evalString name
