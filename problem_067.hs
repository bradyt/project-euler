-- Maximum path sum II
-- Problem 67

-- By starting at the top of the triangle below and moving to adjacent
-- numbers on the row below, the maximum total from top to bottom is
-- 23.

-- 3
-- 7 4
-- 2 4 6
-- 8 5 9 3

-- That is, 3 + 7 + 4 + 9 = 23.

-- Find the maximum total from top to bottom in triangle.txt (right
-- click and 'Save Link/Target As...'), a 15K text file containing a
-- triangle with one-hundred rows.

-- NOTE: This is a much more difficult version of Problem 18. It is
-- not possible to try every route to solve this problem, as there are
-- 299 altogether! If you could check one trillion (1012) routes every
-- second it would take over twenty billion years to check them all.
-- There is an efficient algorithm to solve it. ;o)

import System.IO
import Data.Char (digitToInt)
import Data.Digits (unDigits)

intStrToInt :: [Char] -> Int
intStrToInt = (unDigits 10) . map digitToInt

main :: IO ()
main = do file <- readFile "./p067_triangle.txt"
          let triangleList =
                map ((map intStrToInt) . words) $ lines file
          print $ maximumTotal triangleList

combiningFunction :: [Int] -> [Int] -> [Int]
combiningFunction xs ys =
  [ (xs!!i) + max (ys!!i) (ys!!(i+1)) | i <- [0..l-1] ]
      where l = length xs

maximumTotal :: [[Int]] -> [Int]
maximumTotal xss = foldr1 combiningFunction xss

-- problem18 :: [Int]
-- problem18 = maximumTotal largerTriangle
