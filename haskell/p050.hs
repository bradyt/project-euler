-- Consecutive prime sum
-- Problem 50

-- The prime 41, can be written as the sum of six consecutive primes:
-- 41 = 2 + 3 + 5 + 7 + 11 + 13

-- This is the longest sum of consecutive primes that adds to a prime
-- below one-hundred.

-- The longest sum of consecutive primes below one-thousand that adds
-- to a prime, contains 21 terms, and is equal to 953.

-- Which prime, below one-million, can be written as the sum of the
-- most consecutive primes?

import Math.NumberTheory.Primes

generateLongSums = go 0 0
  where go l i =
          let nextSum = sum $ map (\i -> primes !! i) [i..l]
          in if isPrime nextSum
             then nextSum : go (l+1) 0
             else go l (i+1)

getLargestSum = last $ takeWhile (<10^6) generateLongSums

-- main = print getLargestSum
main = print "5 seconds"

