-- Quadratic primes
-- Problem 27

-- Euler discovered the remarkable quadratic formula:

--                 n^2 + n + 41

-- It turns out that the formula will produce 40 primes for the
-- consecutive integer values 0 ≤ n ≤ 39. However, when n = 40, 40^2 +
-- 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n
-- = 41, 41^2+41+41 is clearly divisible by 41.

-- The incredible formula n^2 − 79n + 1601 was discovered, which
-- produces 80 primes for the consecutive values 0 ≤ n ≤ 79. The
-- product of the coefficients, −79 and 1601, is −126479.

-- Considering quadratics of the form:

--     n^2 + an + b, where |a|<1000 and |b|≤1000

-- where |n| is the modulus/absolute value of n
-- e.g. |11|=11 and |−4|=4

-- Find the product of the coefficients, a and b, for the quadratic
-- expression that produces the maximum number of primes for
-- consecutive values of n, starting with n = 0.

import Math.NumberTheory.Primes

quadForm :: Num a => a -> a -> a -> a
quadForm a b = \n -> n^2 + a*n + b

countPrimes :: Integer -> Integer -> Int
countPrimes a b = length $ takeWhile isPrime $ map (quadForm a b) [0..]

asAndBs :: [(Integer, Integer)]
asAndBs = [ (a, b) | b <- [-999,-997..999] , isPrime b
                   , a <- [-999,-997..999] ]

find :: (Integer, Int)
find = foldr updateMax (0, 0) asAndBs
  
updateMax :: (Integer, Integer) -> (Integer, Int) -> (Integer, Int)
updateMax (a, b) (p, m) = let nextCount = countPrimes a b
                                 in if nextCount > m
                                    then (a * b, nextCount)
                                    else (p,     m)

problem27 :: Integer
problem27 = fst find

-- main = print problem27
main = print "4 seconds"
