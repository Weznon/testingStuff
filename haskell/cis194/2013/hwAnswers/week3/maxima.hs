localMaxima :: [Integer] -> [Integer]
localMaxima []          = []
localMaxima [x]         = []
localMaxima (x:y:xs)    = if xs /= []
                                then if y > x && y > head xs then y:localMaxima(y:xs) else localMaxima(y:xs)
                                else []
main :: IO()
main = print (localMaxima [1,4,5,4,6,6,3,4,2,4,9])
