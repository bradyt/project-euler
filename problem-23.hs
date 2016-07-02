-- Non-abundant sums
-- Problem 23

-- A perfect number is a number for which the sum of its proper
-- divisors is exactly equal to the number. For example, the sum of
-- the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which
-- means that 28 is a perfect number.

-- A number n is called deficient if the sum of its proper divisors is
-- less than n and it is called abundant if this sum exceeds n.

-- As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the
-- smallest number that can be written as the sum of two abundant
-- numbers is 24. By mathematical analysis, it can be shown that all
-- integers greater than 28123 can be written as the sum of two
-- abundant numbers. However, this upper limit cannot be reduced any
-- further by analysis even though it is known that the greatest
-- number that cannot be expressed as the sum of two abundant numbers
-- is less than this limit.

-- Find the sum of all the positive integers which cannot be written
-- as the sum of two abundant numbers.

import Data.Map (Map)
import qualified Data.Map as M
import Math.NumberTheory.Primes.Factorisation
import Control.Applicative
import Data.Maybe (fromJust)

isAbundant :: Integer -> Bool
isAbundant n = (> 2*n) $ sum $ divisors n

allAbundants :: [Integer]
allAbundants = filter isAbundant [1..28123]

abundantMap :: Map Int Integer
abundantMap = M.fromList $ zip [0..] allAbundants

convertAbundantPtToSum :: (Int, Int) -> Integer
convertAbundantPtToSum (x, y) = fromJust $
  (+) <$> (M.lookup x abundantMap) <*> (M.lookup y abundantMap)

abundantSumsArray :: Map Integer [(Int, Int)]
abundantSumsArray = M.fromList [ (convertAbundantPtToSum (i, i), [(i, i)])
                               | i <- [0..(length allAbundants) - 1] ]

updateSums :: Map Integer [(Int, Int)] -> (Int, Int) -> Map Integer [(Int, Int)]
updateSums array point
  | snd point < (length allAbundants) =
      M.insertWith (++) (convertAbundantPtToSum point) [point] array
  | otherwise                = array

-- removeSums :: [Integer] -> [Integer]
-- removeSums xs = removeSumsRec xs abundantSumsArray

-- removeSumsRec :: [Integer] -> Map Integer [(Integer, Integer)] -> [Integer]
-- removeSumsRec [] _         = []
-- removeSumsRec (x:xs) array =
--   case (M.lookup x array) of
--     Nothing     -> x:removeSumsRec xs array
--     Just points -> removeSumsRec xs (foldl
--                                         reinsert (M.delete x array) points)
--   where reinsert :: Map Integer [(Integer, Integer)]
--                  -> (Integer, Integer)
--                  -> Map Integer [(Integer, Integer)]
--         reinsert array' (p1, p2) =
--           case (M.lookup (p2+1) abundantMap) of
--             Just nextAbundant -> 
--               M.insertWith (++) val [(p1, p2+1)] array'
--               where val = 
--                       (abundantMap M.! p1) +
--                       nextAbundant
--             Nothing -> array'

-- sieve :: [Integer] -> [Integer]
-- sieve ys = sieve' ys M.empty
--   where
--     sieve' []     _     = []
--     sieve' (x:xs) table =
--       case (M.lookup x table) of
--         Nothing    -> x : sieve' xs (M.insert (x*x) [x] table)
--         Just facts -> sieve' xs (foldl reinsert (M.delete x table) facts)
--       where
--         reinsert table' prime = M.insertWith (++) (x+prime) [prime] table'

