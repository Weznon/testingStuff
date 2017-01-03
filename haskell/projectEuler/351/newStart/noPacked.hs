--import Math.NumberTheory.Primes
import Math.NumberTheory.ArithmeticFunctions

merp :: [Int]
merp = map (\x -> x - totient x) [1..100000000]

main :: IO()
main = print $ 6 * (sum merp)

