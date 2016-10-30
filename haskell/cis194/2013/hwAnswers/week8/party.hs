import Employee
import Data.Monoid
import Data.Tree

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
treeFold :: (a -> [b] -> b) -> Tree a -> b
treeFold f (Node a []) = f a []
treeFold f (Node a forest) = f a (map (treeFold f) forest)

--3
nextLevel :: Employee -> [(GuestList, GuestList)] -> (GuestList, GuestList)
nextLevel boss guestlist = ((glCons boss glWithBoss),glNoBoss)
                          where unzipped = unzip guestlist
                                glWithBoss = mconcat (fst unzipped)
                                glNoBoss = mconcat (snd unzipped)
--unziped turns it into two list of the guestlists
--the mconcat turns all of the sub trees into one tree, under the new boss
--then finally returns one with the boss, one without

--4
maxFun :: Tree Employee -> GuestList
maxFun emp = pickMax (treeFold nextLevel emp)
  where pickMax (gl1@(GL _ f1), gl2@(GL _ f2))
         | f1 > f2 = gl1
         | otherwise = gl2
--takes maximum from the folded employees, using nextLevel as the fold
--makes sense since next level returns both when the boss is there and not

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

--5
main :: IO()
main = do
        let list = readFile company.txt
        let maxi = maxFun $ read list
        putStrLn
