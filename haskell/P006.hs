module P006 where

-- Sum square difference
-- Problem 6

-- The sum of the squares of the first ten natural numbers is,
-- 12 + 22 + ... + 102 = 385

-- The square of the sum of the first ten natural numbers is,
-- (1 + 2 + ... + 10)^2 = 55^2 = 3025

-- Hence the difference between the sum of the squares of the first
-- ten natural numbers and the square of the sum is 3025 − 385 = 2640.

-- Find the difference between the sum of the squares of the first one
-- hundred natural numbers and the square of the sum.

sumToN :: Integral a => a -> a
sumToN n = n * (n + 1) `div` 2

sumSqrsToN :: Integral a => a -> a
sumSqrsToN n = n * (n + 1) * (2*n + 1) `div` 6

p006 :: Integral a => a
p006 = (sumToN 100)^2 - sumSqrsToN 100

main :: IO ()
main = print p006
