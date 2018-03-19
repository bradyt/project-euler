module P045 where

-- Triangular, pentagonal, and hexagonal
-- Problem 45

-- Triangle, pentagonal, and hexagonal numbers are generated by the
-- following formulae:
-- | Triangle   | Tn=n(n+1)/2  | 1, 3, 6, 10, 15, ...  |
-- | Pentagonal | Pn=n(3n−1)/2 | 1, 5, 12, 22, 35, ... |
-- | Hexagonal  | Hn=n(2n−1)   | 1, 6, 15, 28, 45, ... |

-- It can be verified that T285 = P165 = H143 = 40755.

-- Find the next triangle number that is also pentagonal and
-- hexagonal.

import Control.Monad (guard)
import Math.NumberTheory.Powers.Squares (exactSquareRoot)

t n = n * (n + 1) `div` 2

isPentagonal :: Integral a => a -> Bool
isPentagonal n = case (exactSquareRoot $ 24 * n + 1) of
  Nothing -> False
  Just r -> r `mod` 6 == 5

isHexagonal :: Integral a => a -> Bool
isHexagonal n = case (exactSquareRoot $ 8 * n + 1) of
  Nothing -> False
  Just r  -> r `mod` 4 == 3

array = do
  i <- [286..]
  let ti = t i
  guard $ isPentagonal ti
  guard $ isHexagonal ti
  return ti

p045 = head array

main = print p045