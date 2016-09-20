module Calc where
import ExprT
import Parser
{-
data ExprT = Lit Integer
           | Add ExprT ExprT
           | Mul ExprT ExprT
  deriving (Show, Eq)
-}
--Excersize 1
eval :: ExprT -> Integer
eval (Lit a) = a
eval (Add a b) = (eval a) + (eval b)
eval (Mul a b) = (eval a) * (eval b)

--Excersize 2
evalStr :: String -> Maybe Integer
evalStr = fmap eval . Parser.parseExp Lit Add Mul

--Excersize 3
class Expr a where
    lit :: Integer -> a
    add :: a -> a -> a
    mul :: a -> a -> a

instance Expr ExprT where
    lit = ExprT.Lit
    add = ExprT.Add
    mul = ExprT.Mul

reify :: ExprT -> ExprT
reify = id

--Excersize 4
instance Expr Integer where
    lit = id
    add = (+)
    mul = (*)
instance Expr Bool where
    lit x | x <= 0 = False | otherwise = True
    add = (||)
    mul = (&&)

newtype MinMax = MinMax Integer deriving (Eq, Show)

newtype Mod7 = Mod7 Integer deriving (Eq, Show)

newtype MyOwn = MyOwn Integer deriving (Eq, Show)

instance Expr MinMax where
    lit = MinMax
    add (MinMax x) (MinMax y)= MinMax (max x y)
    mul (MinMax x) (MinMax y)= MinMax (min x y)

instance Expr Mod7 where
    lit x = Mod7 (x `mod` 7)
    add (Mod7 x) (Mod7 y)= Mod7 ((x + y) `mod` 7)
    mul (Mod7 x) (Mod7 y)= Mod7 ((x * y) `mod` 7)

instance Expr MyOwn where
    lit x = MyOwn 5
    add (MyOwn x) (MyOwn y) = MyOwn (x + y + 5)
    mul (MyOwn x) (MyOwn y) = MyOwn (x * y * 5)

testExp :: Expr a => Maybe a
testExp = parseExp lit add mul "5 * 6"

testInteger = testExp :: Maybe Integer
testBool = testExp :: Maybe Bool
testMM = testExp :: Maybe MinMax
testSat = testExp :: Maybe Mod7
testMine = testExp :: Maybe MyOwn

--Excersize 5
