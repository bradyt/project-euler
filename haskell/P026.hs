module P026 where

-- Reciprocal cycles
-- Problem 26

-- A unit fraction contains 1 in the numerator. The decimal
-- representation of the unit fractions with denominators 2 to 10 are
-- given:

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

import Data.Bool (bool)
import Data.List (find)
import Data.Tuple.HT (uncurry3, thd3)
import Data.Ratio ((%), Ratio, denominator)

test :: (Integral a, Eq a) => a -> a -> a -> Bool
test d k n = (==1) . denominator $ (1 % d) * (10^k) *
             (bool (10^n - 1) 1 (n == 0))

testD :: Integral a => a -> Maybe a
testD d = fmap thd3 $ find (uncurry3 test)
          [ (d, k, n) | k <- [0..], n <- [0..d] ]

p026 = fst . last $ takeWhileDLargerThanN

takeWhileDLargerThanN :: Integral a => [(a, a)]
takeWhileDLargerThanN = takeWhile (\(x, y) -> x > y) dAndLength

dAndLength :: Integral a => [(a, a)]
dAndLength = scanl f (1001, 0) [1000, 999..]
    where f (_, n) d = case testD d of
              Nothing -> (d, n)
              Just y  -> (d, max n y)

main :: IO ()
main = print p026
-- main = do
--     putStr "2\t" >> print (testD 2 == Just 0)
--     putStr "3\t" >> print (testD 3 == Just 1)
--     putStr "4\t" >> print (testD 4 == Just 0)
--     putStr "5\t" >> print (testD 5 == Just 0)
--     putStr "6\t" >> print (testD 6 == Just 1)
--     putStr "7\t" >> print (testD 7 == Just 6)
--     putStr "8\t" >> print (testD 8 == Just 0)
--     putStr "9\t" >> print (testD 9 == Just 1)
--     putStr "10\t" >> print (testD 10 == Just 0)
