-- Smallest multiple
-- Problem 5

-- 2520 is the smallest number that can be divided by each of the
-- numbers from 1 to 10 without any remainder.

-- What is the smallest positive number that is evenly divisible by
-- all of the numbers from 1 to 20?

import Math.NumberTheory.Primes.Factorisation (factorise)
import Data.List (groupBy, sort)

p005 = product . map (uncurry (^) . maximum) .
  groupBy (\(x, _) (y, _) -> x == y) .
  sort . concatMap factorise $ [1..20]

main :: IO ()
main = print p005
