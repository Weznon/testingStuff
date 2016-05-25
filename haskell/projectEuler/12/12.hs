--testDivisors :: Int -> [Int]
--testDivisors x = filter (\z -> x `rem` z == 0) [1..(x `div` 2)]

--triangleNumbers :: [Int]
--triangleNumbers = [(x * x + x) `div` 2 | x <- [1..]]

--withDivisors :: [Int]
--withDivisors = filter (\x -> length(testDivisors x) >= 500) triangleNumbers

divisors :: Int -> [Int]
divisors x = 1 : (divisors' x 2)
                where divisors' z n
                                |n * n > z      = [z]
                                |n * n == z     = [n, z]
                                |z `rem` n == 0 = n : z `div` n :(divisors' z (n+1))
                                |otherwise      = divisors' z (n+1)
triangdivs :: [(Int, Int)]
triangdivs = [(n * (n + 1) `div` 2, numDiv n) | n <- [1..]]
                where numDiv x
                        |x <= 3         = 0
                        |x `rem` 2 == 0 = divi(x `div` 2) * divi(x + 1)
                        |otherwise      = divi(x) * divi((x + 1) `div` 2)
                        where divi = length . divisors
main :: IO()
main = print (fst . head . filter ((> 500) . snd) $ triangdivs)
