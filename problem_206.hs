-- Concealed Square
-- Problem 206

-- Find the unique positive integer whose square has the form
-- 1_2_3_4_5_6_7_8_9_0,
-- where each “_” is a single digit.

import Data.Digits
import Data.List

nthDigit m 0 = m `mod` (10)
nthDigit m n = nthDigit (m `div` 10) (n-1)

ithFilter :: Integral a => a -> [a] -> [a]
ithFilter 0 = filter (\z -> 0 == nthDigit z 0)
ithFilter i = filter (\z -> (10-i) == nthDigit z 2*i)
-- ithFilter 1 = filter (\z -> 9 == nthDigit z 2)
-- ithFilter 2 = filter (\z -> 8 == nthDigit z 2)
-- ithFilter 3 = filter (\z -> 7 == nthDigit z 2)
-- ithFilter 4 = filter (\z -> 6 == nthDigit z 2)
-- ithFilter 5 = filter (\z -> 5 == nthDigit z 2)
-- ithFilter 6 = filter (\z -> 4 == nthDigit z 2)

filtered = go 1 [ x^2 | x <- [0..] ]
  where go 3 xs = xs
        go i xs = go (i+1) ((ithFilter i) xs)

-- filter (\z -> 0 == nthDigit z 0) [ x^2 | x <- [0..] ]
-- filter (\z -> 9 == nthDigit z 2) [ x^2 | x <- [0..] ]
-- filter (\z -> 8 == nthDigit z 4) [ x^2 | x <- [0..] ]
-- filter (\z -> 7 == nthDigit z 6) [ x^2 | x <- [0..] ]
-- filter (\z -> 6 == nthDigit z 8) [ x^2 | x <- [0..] ]
-- filter (\z -> 5 == nthDigit z 10) [ x^2 | x <- [0..] ]
-- filter (\z -> 4 == nthDigit z 12) [ x^2 | x <- [0..] ]
-- filter (\z -> 3 == nthDigit z 14) [ x^2 | x <- [0..] ]
-- filter (\z -> 2 == nthDigit z 16) [ x^2 | x <- [0..] ]
-- filter (\z -> 1 == nthDigit z 18) [ x^2 | x <- [0..] ]


isSquare x = (floor $ sqrt $ fromIntegral x)^2 == x

-- 1 0, 2 2, 3 4

isOf n = let ns = digits 10 n in
  if length ns == 19
  then all (\i -> (ns!!(2*i)) == (i+1)) [0..9]
  else False



ints = [ unDigits 10 [1,a,2,b,3,c,4,d,5,e,6,f,7,g,8,h,9,0,0]
       | a <- [0..9]
       , b <- [0..9]
       , c <- [0..9]
       , d <- [0..9]
       , e <- [0..9]
       , f <- [0..9]
       , g <- [0..9]
       , h <- [0,2,4,6,8]
       -- , i <- [0..9]
       ]
