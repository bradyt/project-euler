-- Permuted multiples
-- Problem 52

-- It can be seen that the number, 125874, and its double, 251748,
-- contain exactly the same digits, but in a different order.

-- Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x,
-- and 6x, contain the same digits.

import Data.Digits
import Data.List

multipleIsPermutation x n = n*x `elem` permsOfX
  where permsOfX = map (unDigits 10) $ permutations $ digits 10 x

forAllSix x = all (multipleIsPermutation x) [2..6]

findFirst = head $ filter forAllSix [2..]

-- main = print findFirst
main = print "32 seconds"
