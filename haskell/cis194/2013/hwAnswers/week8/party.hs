import Employee

--1.1
glCons :: Employee -> GuestList -> GuestList
glCons inputE (GL listE fun) = (GL (inputE:listE) (fun+(empFun inputE)))

--1.2
instance Monoid GuestList where
  mempty = (GL [] 0)
  --Non Record syntax
  --(GL emp1 fun1) `mappend` (GL emp2 fun2) = (GL (emp1 ++ emp2) (fun1 + fun2))
  --Required a change in the Employee.hs file
  --Record Syntax(ayy)
  gl1 `mappend` gl2 = (GL (getEmp gl1 ++ getEmp gl2) (getFun gl1 + getFun gl2))
--1.3
moreFun :: GuestList -> GuestList -> GuestList
moreFun gl1 gl2
  | fun1 > fun2   = gl1
  | otherwise     = gl2
  where fun1 = getFun gl1
        fun2 = getFun gl2
--2
--treeFold :: (a -> b) -> Tree a -> b
--This is not the correct type signature. from the lecture notes its
--:: b -> (b -> a -> b -> b) -> Tree a -> b
--wtf?


--Some test values
bob :: Employee
bob = (Emp "Bob" 5)

kate :: Employee
kate = (Emp "Kate" 6)

wen :: Employee
wen = (Emp "Wen" 55)

glkb :: GuestList
glkb = (GL [kate, bob] 11)

glbw :: GuestList
glbw = (GL [bob, wen] 61)

main :: IO()
main = do
        let bob = (Emp "Bob" 5)
        let kate = (Emp "Kate" 6)
        let wen = (Emp "Wen" 55)
        let gl = (GL [kate, bob] 11)
        putStrLn "boi"

