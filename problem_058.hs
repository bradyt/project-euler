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
import Data.Ratio

-- index by bottom right diagonal, so

-- | i | l | d0 |   |
-- | 0 | 1 | 1  |   |
-- | 1 | 3 | 9  |   |
-- | 2 | 5 | 25 |   |
-- | 3 | 7 | 36 |   |

-- l = 2*i + 1
-- d0 = l^2
-- dj = d0 + 

-- |  3 |  5 |  7 |  9 |
-- | 13 | 17 | 21 | 25 |
-- | 31 | 37 | 43 | 49 |

-- | +2 | +2 |
-- | +4 | +4 |
-- | +6 | +6 | 

-- (///) n d =
--   (fromIntegral n) / (fromIntegral d)

-- diagsTo :: Integer -> [Integer]
-- -- diagsTo 0 = [1]
-- -- diagsTo n = (diagsTo (n-1)) ++
-- --   [ l^2 - 2*n*d | d <- [3,2..0], let l = 2*n + 1 ]
-- diagsTo n = 1 : [ l^2 - 2*i*d | i <- [1..n], d <- [0..3]
--                                 , let l = 2*i + 1]

nthCorners 0 = [1]
nthCorners n = let l = 2*n + 1 in [ l^2 - 2*n*d | d <- [3,2,1] ]

nthNoOfPrimes = fromIntegral . length . (filter isPrime) . nthCorners

noOfPrimes n = sum $ map nthNoOfPrimes [1..n]

measureTo :: Integer -> Ratio Integer
measureTo n = (noOfPrimes n) / (fromIntegral $ 1+4*n)

measuresToLessThanTenPercent = (<0.1) . measureTo

problem58 n m = head $ filter measuresToLessThanTenPercent [(m*10^n)..]

-- 26241
