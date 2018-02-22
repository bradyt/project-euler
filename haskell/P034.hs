module P034 where

-- Digit factorials
-- Problem 34

-- 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

-- Find the sum of all numbers which are equal to the sum of the
-- factorial of their digits.

-- Note: as 1! = 1 and 2! = 2 are not sums they are not included.

import Data.Char (digitToInt)

intToList :: Int -> [Int]
intToList = (map digitToInt) . show

factorial = product . (enumFromTo 1)

isDigitFactorial :: Int -> Bool
isDigitFactorial 1 = False
isDigitFactorial 2 = False
isDigitFactorial n = (==n) $ sum $ map factorial $ intToList n

p034 = sum $ take 2 $ filter isDigitFactorial [10..]

main = print p034
