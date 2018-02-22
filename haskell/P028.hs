module P028 where

-- Number spiral diagonals
-- Problem 28

-- Starting with the number 1 and moving to the right in a clockwise
-- direction a 5 by 5 spiral is formed as follows:

-- 21 22 23 24 25
-- 20  7  8  9 10
-- 19  6  1  2 11
-- 18  5  4  3 12
-- 17 16 15 14 13

-- It can be verified that the sum of the numbers on the diagonals is
-- 101.

-- What is the sum of the numbers on the diagonals in a 1001 by 1001
-- spiral formed in the same way?

-- 1x1 -> 1
--        previous row, side length, total,  starting, corners
-- 3x3 -> 2             3            4 * 2   2,3       [3,5,7,9]
-- 5x5 -> 4             5            4 * 4   10,13     [13,17,21,25]
-- 7x7 -> 6             7            4 * 6   26,31     [31,37,43,49]
-- 9x9 -> 8             9            4 * 8   50,57     [57,65,73,81]

-- kxk ->               k            4*(k-1)           [x,x+k,x+2k,x+3k]

ne :: (Num a, Eq a) => a -> a
ne 0 = undefined
ne 1 = 1
ne k = ne (k-2) + 4 * (k-1)

kthContribution k = 4 * ne k - 6 * (k-1)

p028 = (1+) $ sum $ map kthContribution [3,5..1001]

main = print p028
