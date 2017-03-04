-- Multiples of 3 and 5
-- Problem 1

-- If we list all the natural numbers below 10 that are multiples of 3
-- or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

-- Find the sum of all the multiples of 3 or 5 below 1000.

import Data.Function ((&))

sumToN :: Integral a => a -> a
sumToN n = n * (n + 1) `div` 2

sumMultiplesToN :: Integral a => a -> a -> a
sumMultiplesToN n m = (m *) . sumToN $ n `div` m

sumOfMultiplesOf3And5 :: Integral a => a
sumOfMultiplesOf3And5 = map (sumMultiplesToN 999) [3, 5, 15]
  & (\[x, y, z] -> x + y - z)

main :: IO ()
main = print sumOfMultiplesOf3And5
