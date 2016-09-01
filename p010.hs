
-- Summation of primes
-- Problem 10

-- The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

-- Find the sum of all the primes below two million.

-- sieve :: [Integer] -> [Integer]
-- sieve ys = sieve' ys Map.empty
--   where
--     sieve' []     _     = []
--     sieve' (x:xs) table =
--       case (Map.lookup x table) of
--         Nothing    -> x : sieve' xs (Map.insert (x*x) [x] table)
--         Just facts -> sieve' xs (foldl reinsert (Map.delete x table) facts)
--       where
--         reinsert table' prime = Map.insertWith (++) (x+prime) [prime] table'

-- problem10 :: Integer
-- problem10 = sum $ sieve [2..2*10^6-1]

import Math.NumberTheory.Primes

problem10 :: Integer
problem10 = sum $ takeWhile (< 2 * 10^6) primes

main = print problem10
