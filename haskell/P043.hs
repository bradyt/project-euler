module P043 where

-- Sub-string divisibility
-- Problem 43

-- The number, 1406357289, is a 0 to 9 pandigital number because it is
-- made up of each of the digits 0 to 9 in some order, but it also has
-- a rather interesting sub-string divisibility property.

-- Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this
-- way, we note the following:

--     d_2d_3d_4=406 is divisible by 2
--     d_3d_4d_5=063 is divisible by 3
--     d_4d_5d_6=635 is divisible by 5
--     d_5d_6d_7=357 is divisible by 7
--     d_6d_7d_8=572 is divisible by 11
--     d_7d_8d_9=728 is divisible by 13
--     d_8d_9d_10=289 is divisible by 17

-- Find the sum of all 0 to 9 pandigital numbers with this property.

import Data.Bool (bool)
import Data.Digits (unDigits)
import Data.List ((\\))

main :: IO ()
main = print p043

p043 :: Int
p043 = bt []

bt :: [Int] -> Int
bt c
    | length c == 10         = bool (unDigits 10 c) 0 (head c == 0)
    | length c >= 3
      && not (hasProperty c) = 0
    | otherwise              = sum . map (bt . (:c)) $ [0..9] \\ c

hasProperty :: [Int] -> Bool
hasProperty c = let p = primes !! (length c - 3)
                in unDigits 10 (take 3 c) `mod` p == 0

primes :: [Int]
primes = [17, 13, 11, 7, 5, 3, 2]
