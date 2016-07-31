-- Powerful digit counts
-- Problem 63

-- The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the
-- 9-digit number, 134217728=8^9, is a ninth power.

-- How many n-digit positive integers exist which are also an nth
-- power?

import Data.Digits
import Control.Monad

so s = do
  x <- [1..s :: Integer]
  n <- [0..s-x]
  let y = x^n
  guard (length (digits 10 y) == fromIntegral n)
  return y
