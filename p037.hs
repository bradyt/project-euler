-- Truncatable primes
-- Problem 37

-- The number 3797 has an interesting property. Being prime itself, it
-- is possible to continuously remove digits from left to right, and
-- remain prime at each stage: 3797, 797, 97, and 7. Similarly we can
-- work from right to left: 3797, 379, 37, and 3.

-- Find the sum of the only eleven primes that are both truncatable
-- from left to right and right to left.

-- NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

import Math.NumberTheory.Primes
import qualified Data.Set as S
import Control.Applicative ((<*>), liftA2)

import Data.List (tails)

truncateLeft :: Integer -> Integer
truncateLeft = (<*>) mod ((^) 10 . floor . logBase 10 . fromIntegral)

truncateRight :: Integer -> Integer
truncateRight = flip div 10

directionTruncatable :: (Integer -> Integer) -> Integer -> Bool
directionTruncatable f n = go n
  where go n
          | n `elem` [2,3,5,7] = True
          | not $ isPrime n    = False
          | otherwise          = go $ f n

truncatableLeft = directionTruncatable truncateLeft
truncatableRight = directionTruncatable truncateRight

truncatableBoth = liftA2 (&&) truncatableLeft truncatableRight

problem37 = sum $ drop 4 $ take 15 $
  filter truncatableBoth primes
