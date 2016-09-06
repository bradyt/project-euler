-- Non-abundant sums
-- Problem 23

-- A perfect number is a number for which the sum of its proper
-- divisors is exactly equal to the number. For example, the sum of
-- the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which
-- means that 28 is a perfect number.

-- A number n is called deficient if the sum of its proper divisors is
-- less than n and it is called abundant if this sum exceeds n.

-- As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the
-- smallest number that can be written as the sum of two abundant
-- numbers is 24. By mathematical analysis, it can be shown that all
-- integers greater than 28123 can be written as the sum of two
-- abundant numbers. However, this upper limit cannot be reduced any
-- further by analysis even though it is known that the greatest
-- number that cannot be expressed as the sum of two abundant numbers
-- is less than this limit.

-- Find the sum of all the positive integers which cannot be written
-- as the sum of two abundant numbers.

import Control.Applicative
import Control.Monad
import Data.Monoid
import Data.Foldable
import Data.Maybe
import Math.NumberTheory.Primes.Factorisation
import qualified Data.IntSet as IS
import Data.IntSet (IntSet)

upperLimit :: Integral a => a
upperLimit = 28123

candidates :: Integral a => [a]
candidates = [1..upperLimit]

isAbundant :: Integral a => a -> Bool
isAbundant n = divisorSum m > 2 * m
  where m = fromIntegral n
                  
abundants :: Integral a => [a]
abundants = filter isAbundant [1..upperLimit]

space = IS.fromList [ x + y | x <- abundants, y <- [1..x],
                      y `elem` abundants  ]

-- p023 :: Integral a => a
p023 = IS.size space

main :: IO ()
main = print "slow (>5s)"
-- main = print p023
