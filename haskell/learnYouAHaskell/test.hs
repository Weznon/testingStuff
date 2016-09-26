doubleMe :: Num a => a -> a
doubleMe x = 2 * x
doubleUs :: Num a => a -> a -> a
doubleUs x y = doubleMe x + doubleMe y
doubleShit :: (Ord a, Num a) => a -> a
doubleShit x = if x < 100 then 2 * x else x
doubleShit' :: (Num a, Ord a) => a -> a
doubleShit' x = doubleShit x + 1
--generates a correct fizzbuzz sequence until y
fizzBuzz :: (Integral a, Show a) => a -> [String]
fizzBuzz y = [if (x `mod` 3 == 0) || (x `mod` 5 == 0)
                then if x `mod` 5 == 0
                    then if x `mod` 3 == 0 then "fizzBuzz"
                            else "buzz"
                      else if x `mod` 3 == 0 then "fizz"
                            else show x
                else show x | x <- [1..y]]
length' x = sum [1 | _ <- x]
--Generates all right triangles with perimeter of x
rightTriangles x = [(a,b,c) | a <-[1..10], b <-[1..10], c<-[1..10], a ^ 2+b ^ 2==c ^ 2, a+b+c==x, a<b, b<c]

main :: IO ()
main = putStrLn "Hello World"
