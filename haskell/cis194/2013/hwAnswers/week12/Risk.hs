{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Risk where

import Control.Monad.Random
import Control.Monad
import Data.List
------------------------------------------------------------
-- Die values

newtype DieValue = DV { unDV :: Int }
  deriving (Eq, Ord, Show, Num)

first :: (a -> b) -> (a, c) -> (b, c)
first f (a, c) = (f a, c)

instance Random DieValue where
  random           = first DV . randomR (1,6)
  randomR (low,hi) = first DV . randomR (max 1 (unDV low), min 6 (unDV hi))

die :: Rand StdGen DieValue
die = getRandom

------------------------------------------------------------
-- Risk

type Army = Int

data Battlefield = Battlefield { attackers :: Army, defenders :: Army }
--1
battle:: Battlefield -> Rand StdGen Battlefield
battle bf1
  | attackers bf1 < 2 || defenders bf1 < 1  = return bf1
  | otherwise = replicateM attackNumber die >>= \a -> replicateM defenseNumber die >>= \as -> return $ battleSim bf1 (sortDesc a) (sortDesc as)
    where attackNumber = min 3  (attackers bf1 - 1)
          defenseNumber = min 2 (defenders bf1)
          sortDesc = sortBy (flip compare)

battleSim :: Battlefield -> [DieValue] -> [DieValue] -> Battlefield
battleSim bf _ [] = id bf
battleSim bf [] _ = id bf
battleSim bf (a:as) (d:ds)
  |unDV a > unDV d  = battleSim (Battlefield (attackers bf) (defenders bf - 1)) as ds
  |otherwise        = battleSim (Battlefield (attackers bf - 1) (defenders bf)) as ds
--2
invade :: Battlefield -> Rand StdGen Battlefield
invade bf@(Battlefield 1 _) = return bf
invade bf@(Battlefield _ 1) = return bf
invade bf = battle bf >>= invade
--3
num = 1000
successProb :: Battlefield -> Rand StdGen Double
successProb bf = replicateM num (invade bf) >>= \x -> return $ fromIntegral (wins x) / fromIntegral num
  where wins = length . filter ((>1) . attackers)
