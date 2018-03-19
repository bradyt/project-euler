module P040 where

-- Champernowne's constant
-- Problem 40

-- An irrational decimal fraction is created by concatenating the
-- positive integers:

-- 0.123456789101112131415161718192021...

-- It can be seen that the 12th digit of the fractional part is 1.

-- If dn represents the nth digit of the fractional part, find the
-- value of the following expression.

-- d_1 × d_10 × d_100 × d_1000 × d_10000 × d_100000 × d_1000000

import Data.Digits (digits)

d n = (!!(n-1)) $ concatMap (digits 10) [1..]

indices = map (10^) [0..6]

p040 = product $ map d indices

main = print p040