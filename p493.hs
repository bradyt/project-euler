-- Under The Rainbow
-- Problem 493

-- 70 colored balls are placed in an urn, 10 for each of the seven
-- rainbow colors.

-- What is the expected number of distinct colors in 20 randomly
-- picked balls?

-- Give your answer with nine digits after the decimal point
-- (a.bcdefghij).

import Data.Ratio

factorial :: Integral a => a -> a
factorial = product . enumFromTo 1

fac = factorial

-- P(X) = probability of X colors in 20, for X=0,1,...7
p :: Int -> Ratio Int
p 0 = 0
p 1 = 0
p 2 = p 10 * p 10
p 3 = p 10 * p 9 * p 1 + p 10 * p 8 * p 2 -- + ...

main = print "no solution"

-- multinomial? 

-- Q(X) =

-- what if we had 15 balls, 5 for each of 3 colors?

-- we pick 6 balls, what is expected number of colors?

-- p 0 = p 1 = 0, p 2 =


-- o o o o o o | o o o o o o o o o

-- there are 15! % (5!)^3 arrangements of colors

-- pick two colors, there 3 choose 2 ways.
-- now with those two colors, permute them around.
-- 6! % 
