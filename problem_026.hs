
-- https://projecteuler.net/problem=26

import Data.Ratio

test d k n = (1 % d) * (10^k - 1) * (10^n)

-- incorrectly giving `recurring 6` as 0, should be 1. 
recurring d = go d 1 0
  where go d k n
          | numerator   result == 0 = 0
          | denominator result == 1 = k
          | otherwise = if k + 1 < d
                        then go d (k + 1) n
                        else go d 0       (n + 1)
          where result = test d k n

-- but gives correct answer! 
search = go 2 (0, 0)
  where go d' (d, l) =
          if d' < 1000
          then let l' = recurring d'
               in if l' > l
                  then go (d'+1) (d', l')
                  else go (d'+1) (d,  l)
          else d
