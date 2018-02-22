module P053 where

-- Combinatoric selections
-- Problem 53

-- There are exactly ten ways of selecting three from five, 12345:

-- 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345

-- In combinatorics, we use the notation, 5C3 = 10.

-- In general,
-- nCr = n! / r!(n−r)! , where r ≤ n, n! = n×(n−1)×...×3×2×1,
-- and 0! = 1.

-- It is not until n = 23, that a value exceeds one-million: 23C10 =
-- 1144066.

-- How many, not necessarily distinct, values of nCr, for 1 ≤ n ≤ 100,
-- are greater than one-million?

factorial = product . (enumFromTo 1)

comb n r = product [r+1..n] `div` factorial (n-r)

nCrValues = [ comb n r | n <- [1..100], r <- [0..n] ]

p053 = length $ filter (>10^6) nCrValues

main = print p053
