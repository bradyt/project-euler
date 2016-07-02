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

isAbundant :: Integer -> Bool
isAbundant n = (> 2*n) $ sum $ divisors n

areAbundant :: [Integer] -> [Integer]
areAbundant xs = filter isAbundant xs

allAbundants :: [Integer]
allAbundants = areAbundant [1..28123]

isDecomposable :: Integer -> Bool
isDecomposable n = any (`elem` allAbundants) (map (n-) allAbundants)

sumDecomposable :: [Integer] -> Integer
sumDecomposable [] = 0
sumDecomposable (x:xs)
  | isDecomposable x = x + sumDecomposable xs
  | otherwise        = sumDecomposable xs

sieve :: [Integer] -> [Integer]
sieve ys = sieve' ys M.empty
  where
    sieve' []     _     = []
    sieve' (x:xs) table =
      case (M.lookup x table) of
        Nothing    -> x : sieve' xs (M.insert (x*x) [x] table)
        Just facts -> sieve' xs (foldl reinsert (M.delete x table) facts)
      where
        reinsert table' prime = M.insertWith (++) (x+prime) [prime] table'

abundantMap :: Map Integer Integer
abundantMap = M.fromList $ zip [0..] allAbundants

startingArray :: Map Integer [(Integer, Integer)]
startingArray = M.fromList [ (2*a, [(a, a)]) | a <- allAbundants ]

problem23 = go 0 [1..28123] startingArray
  where go :: Integer -> [Integer] -> Map Integer [(Integer, Integer)] -> Integer
        go s []     _     = s
        go s (x:xs) array =
          case (M.lookup x array) of
            Nothing     -> go (s+x) xs array
            Just points -> go s xs (foldl
                                    reinsert (M.delete x array) points)
          where reinsert :: Map Integer [(Integer, Integer)]
                         -> (Integer, Integer)
                         -> Map Integer [(Integer, Integer)]
                reinsert array' (p1, p2) =
                  case (M.lookup (p2+1) abundantMap) of
                    Just nextAbundant -> 
                      M.insertWith (++) val [(p1, p2+1)] array'
                      where val = 
                              (abundantMap M.! p1) +
                              nextAbundant
                    Nothing -> array'
