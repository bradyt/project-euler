-- Distinct primes factors
-- Problem 47

-- The first two consecutive numbers to have two distinct prime
-- factors are:

-- 14 = 2 × 7
-- 15 = 3 × 5

-- The first three consecutive numbers to have three distinct prime
-- factors are:

-- 644 = 2² × 7 × 23
-- 645 = 3 × 5 × 43
-- 646 = 2 × 17 × 19.

-- Find the first four consecutive integers to have four distinct
-- prime factors. What is the first of these numbers?

import Math.NumberTheory.Primes

check :: Int -> Integer -> Bool
check n = (==n) . length . factorise

checkNn :: Int -> Integer -> Bool
checkNn n x = all (check n) [x..x+(fromIntegral n)-1]

p047 = head $ filter (checkNn 4) [1..]

main = print p047
