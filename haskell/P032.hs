module P032 where

-- Pandigital products
-- Problem 32

-- We shall say that an n-digit number is pandigital if it makes use
-- of all the digits 1 to n exactly once; for example, the 5-digit
-- number, 15234, is 1 through 5 pandigital.

-- The product 7254 is unusual, as the identity, 39 × 186 = 7254,
-- containing multiplicand, multiplier, and product is 1 through 9
-- pandigital.

-- Find the sum of all products whose multiplicand/multiplier/product
-- identity can be written as a 1 through 9 pandigital.
-- HINT: Some products can be obtained in more than one way so be sure
-- to only include it once in your sum.

import Data.List (permutations, group, sort)
import Data.Maybe (fromJust, isJust)
import Data.Digits

permsOfNine = permutations [1..9]

maybePandigital :: Int -> [Int] -> Maybe Int
maybePandigital n s = let (s0,  s1)  = splitAt 5 s
                          (s00, s01) = splitAt n s0
                          x = unDigits 10 s00
                          y = unDigits 10 s01
                          z = unDigits 10 s1
                      in if x * y == z
                         then Just z
                         else Nothing

pandigitals :: [Int]
pandigitals = do
  let xs = map (maybePandigital 1) permsOfNine
      ys = map (maybePandigital 2) permsOfNine
      zs = xs ++ ys
  (map head) $ group $ sort $
    map fromJust $ filter isJust zs

-- p032 = sum pandigitals

main = print p032
p032 = "5 seconds"
