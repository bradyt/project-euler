module P010 where

-- Summation of primes
-- Problem 10

-- The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

-- Find the sum of all the primes below two million.

import Math.NumberTheory.Primes

p010 :: Integer
p010 = sum $ takeWhile (< 2 * 10^6) primes

main = print p010
