-- Sub-string divisibility
-- Problem 43

-- The number, 1406357289, is a 0 to 9 pandigital number because it is
-- made up of each of the digits 0 to 9 in some order, but it also has
-- a rather interesting sub-string divisibility property.

-- Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this
-- way, we note the following:

--     d_2d_3d_4=406 is divisible by 2
--     d_3d_4d_5=063 is divisible by 3
--     d_4d_5d_6=635 is divisible by 5
--     d_5d_6d_7=357 is divisible by 7
--     d_6d_7d_8=572 is divisible by 11
--     d_7d_8d_9=728 is divisible by 13
--     d_8d_9d_10=289 is divisible by 17

-- Find the sum of all 0 to 9 pandigital numbers with this property.

import Math.NumberTheory.Primes (primes)
import Data.Digits (digits, unDigits)
import Data.List (permutations)

getThreeSubstrings :: [Integer] -> [Integer]
getThreeSubstrings = (map ((unDigits 10) . tupleToList)) . getThrees
  where tupleToList (x, y, z) = [x, y, z]
        getThrees xs = zip3 xs ys zs
          where ys = tail xs
                zs = tail ys

pandigitalLists :: [[Integer]]
pandigitalLists = permutations [0..9]

problem43 = sum $ map (unDigits 10) $
  filter isSubstringDivisible pandigitalLists

isSubstringDivisible :: [Integer] -> Bool
isSubstringDivisible ns = all
  (\i -> (substrings!!i) `mod` (primes!!i) == 0) [0..6]
  where substrings = tail $ getThreeSubstrings ns
