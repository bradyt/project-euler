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

import Data.List (permutations, sort)
import Math.NumberTheory.Primes (isPrime)
import Data.Digits (digits, unDigits)
import Control.Monad (guard)

-- search by permutations?
-- search by primes? 

integralIsPrime :: Integral a => a -> Bool
integralIsPrime = isPrime . fromIntegral

generateFours :: Integral a => [[a]]
generateFours = [ [x, y, z, w] | x <- [1..9], y <- [x..9], z <- [y..9], w <- [z..9] ]

getPrimePermutations :: Integral a => [a] -> [a]
getPrimePermutations xs = filter integralIsPrime $ map (unDigits 10) $ permutations xs

isRegular :: (Integral a) => [a] -> [(a, a, a)]
isRegular ws = [ (x, y, z) | x <- ws, y <- ws, z <- ws
                           , x < y, y < z
                           , z - y == y - x ]

someRegular ms = let perms = getPrimePermutations ms
                     x = unDigits 10 ms
                in do
  n <- [1..5000]
  let y = x + n
      z = x + 2*n
  guard (y `elem` perms)
  guard (z `elem` perms)
  [(x, y, z)]
    


forAListFindRegularityInThree xs = goIJ 0 1 xs
  where goIJ i j xs
          | i == (n-1) = []
          | i == j     = goIJ (i+1) (i+2) xs
          | otherwise  = if c `elem` xs
                        then (a, b, c) : goIJ i (j+1) xs
                        else goIJ i (j+1) xs
          where a = xs !! i
                b = xs !! j
                c = 2*b - a
                n = length xs

-- x+2*(y-x)
