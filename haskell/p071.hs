-- Ordered fractions
-- Problem 71

-- Consider the fraction, n/d, where n and d are positive integers. If
-- n<d and HCF(n,d)=1, it is called a reduced proper fraction.

-- If we list the set of reduced proper fractions for d ≤ 8 in
-- ascending order of size, we get:

-- 1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5,
-- 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8

-- It can be seen that 2/5 is the fraction immediately to the left of
-- 3/7.

-- By listing the set of reduced proper fractions for d ≤ 1,000,000 in
-- ascending order of size, find the numerator of the fraction
-- immediately to the left of 3/7.

import Data.Ratio
import Control.Monad.State

type Pair = (Int, Int)

p071 :: Int -> Pair
p071 d = execState (stateRecursion (d - 1, d)) (0, 1)

stateRecursion :: Pair -> State Pair Pair
stateRecursion (x, y) =
  if x == 0 || y == 0
    then return (0, 0)
    else do updateMaximum (x, y)
            stateRecursion $ decrementPair (x, y)

updateMaximum :: Pair -> State Pair ()
updateMaximum (x, y) = modify $
  \(xMax, yMax) -> if x % y > xMax % yMax &&
                      x % y < 3 % 7
                   then (x, y)
                   else (xMax, yMax)

decrementPair :: Pair -> Pair
decrementPair (x, y) = if x % y > 3 % 7
                       then (x - 1, y)
                       else (x, y - 1)

-- main = print $ fst $ p071 $ 10^6
main = print "19 seconds"
