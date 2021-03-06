module P041 where

-- Pandigital prime
-- Problem 41

-- We shall say that an n-digit number is pandigital if it makes use
-- of all the digits 1 to n exactly once. For example, 2143 is a
-- 4-digit pandigital and is also prime.

-- What is the largest n-digit pandigital prime that exists?

import Math.NumberTheory.Primes (isPrime)
import Data.Digits (unDigits)
import Data.List (permutations)

pandigitals :: [Integer]
pandigitals = map (unDigits 10) $
  concatMap (\n -> permutations [1..n]) [2..9]

p041 :: Integer
p041 = maximum $ filter isPrime pandigitals

main = print p041
