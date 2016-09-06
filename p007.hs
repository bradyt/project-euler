-- 10001st prime
-- Problem 7

-- By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we
-- can see that the 6th prime is 13.

-- What is the 10 001st prime number?

import Math.NumberTheory.Primes

-- isPrime :: Int -> Bool
-- isPrime a = isPrimeRecursion a [2..]

-- isPrimeRecursion :: Int -> [Int] -> Bool
-- isPrimeRecursion a (x:xs)
--   | x^2 > a        = True
--   | a `mod` x == 0 = False
--   | otherwise      = isPrimeRecursion a ys
--   where ys = filter (\y -> y `mod` x /= 0) xs

-- nthPrime :: Integral a => Int -> a
-- nthPrime n = (filter isPrime [2..]) !! (n-1)

-- problem7 :: Integral a => a
-- problem7 = nthPrime 10001

main = print $ primes !! (10^4)
