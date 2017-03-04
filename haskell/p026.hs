-- Reciprocal cycles
-- Problem 26

-- A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:

--     1/2	= 	0.5
--     1/3	= 	0.(3)
--     1/4	= 	0.25
--     1/5	= 	0.2
--     1/6	= 	0.1(6)
--     1/7	= 	0.(142857)
--     1/8	= 	0.125
--     1/9	= 	0.(1)
--     1/10	= 	0.1 

-- Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle.
-- It can be seen that 1/7 has a 6-digit recurring cycle.

-- Find the value of d < 1000 for which 1/d contains the longest
-- recurring cycle in its decimal fraction part.


-- https://projecteuler.net/problem=26

import Data.Ratio

test d k n = (1 % d) * (10^k - 1) * (10^n)

-- incorrectly giving `recurring 6` as 0, should be 1. 
recurring d = go d 1 0
  where go d k n
          | numerator   result == 0 = 0
          | denominator result == 1 = k
          | otherwise = if k + 1 < d
                        then go d (k + 1) n
                        else go d 0       (n + 1)
          where result = test d k n

-- but gives correct answer! 
search = go 2 (0, 0)
  where go d' (d, l) =
          if d' < 1000
          then let l' = recurring d'
               in if l' > l
                  then go (d'+1) (d', l')
                  else go (d'+1) (d,  l)
          else d

main = print "7 seconds"
-- main = print search
