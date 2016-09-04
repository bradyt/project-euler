-- Factorial digit sum
-- Problem 20

-- n! means n × (n − 1) × ... × 3 × 2 × 1

-- For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
-- and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 +
-- 0 + 0 = 27.

-- Find the sum of the digits in the number 100!

addDigits :: Integer -> Int
addDigits n = go n 0
  where go :: Integer -> Int -> Int
        go 0 s = s
        go n' s =
          let (q, r) = divMod n' 10
          in go q (s + (fromInteger r))

problem20 :: Int
problem20 = addDigits $ product [1..100]

main = print problem20
