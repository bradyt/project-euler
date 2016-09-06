-- Sum square difference
-- Problem 6

-- The sum of the squares of the first ten natural numbers is,
-- 12 + 22 + ... + 102 = 385

-- The square of the sum of the first ten natural numbers is,
-- (1 + 2 + ... + 10)2 = 552 = 3025

-- Hence the difference between the sum of the squares of the first
-- ten natural numbers and the square of the sum is 3025 − 385 = 2640.

-- Find the difference between the sum of the squares of the first one
-- hundred natural numbers and the square of the sum.

diff :: (Enum a, Num a) => a -> a
diff n = (sum [1..n])^(2::Int) - sum ((^(2::Int)) <$> [1..n])

problem6 :: Int
problem6 = diff 100

main = print problem6
