-- Problem 49: Prime permutations

-- The arithmetic sequence, 1487, 4817, 8147, in which each of the
-- terms increases by 3330, is unusual in two ways: (i) each of the
-- three terms are prime, and, (ii) each of the 4-digit numbers are
-- permutations of one another.

-- There are no arithmetic sequences made up of three 1-, 2-, or
-- 3-digit primes, exhibiting this property, but there is one other
-- 4-digit increasing sequence.

-- What 12-digit number do you form by concatenating the three terms
-- in this sequence?

import Data.List (permutations, sort, nub)
import Math.NumberTheory.Primes
import Data.Digits (digits, unDigits)
import Control.Monad

-- * permutation
-- * step size
-- * prime

-- 1. generate primes
-- 2. somehow reduce them to a representative, or sets
-- a) single representative
-- I. generate prime permutations
-- II. generate pairs
-- III. check if next step is prime
-- b) sets
-- I. generate primes
-- II. check if next step is prime

-- 1. generate primes with increasing digits
-- 2. for each prime, generate prime permutations
-- 3. for each pair of permutations:
--         check if the next is in the set. 

permuteDigits :: Integral a => a -> [a]
permuteDigits = nub . sort . map (unDigits 10) . permutations . digits 10

makePrimePerms :: Integer -> [Integer]
makePrimePerms = filter isPrime . permuteDigits

isHeadOfPrimePerms :: Integer -> Bool
isHeadOfPrimePerms = (==) <*> (head . makePrimePerms)

primeSeeds :: [Integer]
primeSeeds = filter isHeadOfPrimePerms primes

makeTriples :: (Num a, Ord a) => [a] -> [(a, a, a)]
makeTriples xs = [ (x, y, 2 * y - x) | x <- xs , y <- xs , x < y ]

makeGoodTriples :: (Num a, Ord a) => [a] -> [(a, a, a)]
makeGoodTriples xs = filter ((`elem` xs) . third) $ makeTriples xs
  where third (_, _, z) = z

tripleToIntegral :: Integral a => (a, a, a) -> a
tripleToIntegral (x, y, z) = (unDigits 10) $
  concatMap (digits 10) [x, y, z]

allGoodTriples :: [[(Integer, Integer, Integer)]]
allGoodTriples = filter (not . null) $
  map (makeGoodTriples . makePrimePerms) primeSeeds

p049 :: Integer
p049 = (!! 1) $ (concatMap . map) tripleToIntegral allGoodTriples

main :: IO ()
main = print p049
