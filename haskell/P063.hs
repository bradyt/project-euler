module P063 where

-- Powerful digit counts
-- Problem 63

-- The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the
-- 9-digit number, 134217728=8^9, is a ninth power.

-- How many n-digit positive integers exist which are also an nth
-- power?

import Data.Digits (digits)

-- 10^(k-1) ≤ nᵏ < 10ᵏ
-- (10/n)ᵏ ≤ 10
-- k*log(10/n) ≤ 1
-- k*(1-log n) ≤ 1
-- k ≤ 1/(1-log n) ≤ 1/(1-log 9) < 22

check :: Integral a => a -> a -> Bool
check n k = (==k) . (fromIntegral . length) . digits 10 $ n^k

p063 = length . filter id $ check <$> [0..9] <*> [0..21]

main = print p063
