-- Spiral primes
-- Problem 58

-- Starting with 1 and spiralling anticlockwise in the following way,
-- a square spiral with side length 7 is formed.

--_37 36 35 34 33 32_31
-- 38_17 16 15 14_13 30
-- 39 18 _5  4 _3 12 29
-- 40 19  6  1  2 11 28
-- 41 20 _7  8  9 10 27
-- 42 21 22 23 24 25 26
--_43 44 45 46 47 48 49

-- It is interesting to note that the odd squares lie along the bottom
-- right diagonal, but what is more interesting is that 8 out of the
-- 13 numbers lying along both diagonals are prime; that is, a ratio
-- of 8/13 ≈ 62%.

-- If one complete new layer is wrapped around the spiral above, a
-- square spiral with side length 9 will be formed. If this process is
-- continued, what is the side length of the square spiral for which
-- the ratio of primes along both diagonals first falls below 10%?

import Math.NumberTheory.Primes

corners :: (Eq a, Num a) => a -> [a]
corners 0 = [1]
corners n = map (\d -> l^2 - 2*n*d) [3, 2, 1]
  where l = 2*n + 1

next :: Integral a => (a, a) -> (a, a)
next (n, t) = ( n + 1
              , t + (countPrimes . corners $ n + 1) )

nextWhile :: Integral a => (a, a) -> a
nextWhile (n, t) = if ratio n t < 0.1 && n > 0
                   then n
                   else nextWhile $ next (n, t)

countPrimes :: Integral a => [a] -> a
countPrimes = fromIntegral . length . filter (isPrime . fromIntegral)

ratio :: (Integral a, Fractional b) => a -> a -> b
ratio n t = fromIntegral t / fromIntegral (1 + 4 * n)

p058 :: Integral a => a
p058 = 1 + 2 * (nextWhile (0, 0))

main :: IO ()
main = print p058
