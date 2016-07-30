-- Concealed Square
-- Problem 206

-- Find the unique positive integer whose square has the form
-- 1_2_3_4_5_6_7_8_9_0,
-- where each “_” is a single digit.

import Data.Digits
import Data.List

a :: Int
a = fromIntegral $ floor $ sqrt 1020304050607080900

b :: Int
b = fromIntegral $ floor $ sqrt 1929394959697989990

-- addOneWhile n i =
--   let n' = n + 10^i
--   in if 

-- 10..13 --> 100..169
-- 101..106 -> 10201..11236
-- 110..119

-- take first digit, we know is 1
-- take second digit, and if third can vary in a way allowable,
-- test each okay value
-- for each such value, try a third value that is okay


filterIJ :: Int -> Int -> Int -> Bool
filterIJ i j = (==j) . (!!i) . digits 10

formFilter :: Int -> Int -> Bool
formFilter n xs = satisfies $ digits 10 xs
  where satisfies xs = all (\i -> i == xs!!(2*(i-1))) [1..n]

ints :: [Int]
ints = [ unDigits 10 [1,a,2,b,3,c,4,d,5,e,6,f,7,g,8,h,9,0,0]
       | a <- [0..6]
       , b <- [0..9]
       , c <- [0..9]
       , d <- [0..9]
       , e <- [0..9]
       , f <- [0..9]
       , g <- [0..9]
       , h <- [0,2,4,6,8]
       -- , i <- [0..9]
       ]
