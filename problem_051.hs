-- Prime digit replacements
-- Problem 51

-- By replacing the 1st digit of the 2-digit number *3, it turns out
-- that six of the nine possible values: 13, 23, 43, 53, 73, and 83,
-- are all prime.

-- By replacing the 3rd and 4th digits of 56**3 with the same digit,
-- this 5-digit number is the first example having seven primes among
-- the ten generated numbers, yielding the family: 56003, 56113,
-- 56333, 56443, 56663, 56773, and 56993. Consequently 56003, being
-- the first member of this family, is the smallest prime with this
-- property.

-- Find the smallest prime which, by replacing part of the number (not
-- necessarily adjacent digits) with the same digit, is part of an
-- eight prime value family.

import Data.Digits (digits, unDigits)
import Math.NumberTheory.Primes (isPrime, primes)
import Data.List (subsequences)

isIntegralPrime :: Integral a => a -> Bool
isIntegralPrime = isPrime . fromIntegral

starThree = [ unDigits 10 [i, 3] | i <- [1..9] ]

replace :: [a] -> [Int] -> a -> [a]
replace ns is m = [ if i `elem` is then m else ns !! i | i <- [0..length ns - 1] ]

replaceIntAtIs :: Integral a => a -> [Int] -> [a]
replaceIntAtIs n is = filter isIntegralPrime $ map (unDigits 10) $ map (replace (digits 10 n) is) [0..9]

replaceIntOverSubsequences n = map (replaceIntAtIs n) $ tail $ subsequences [0..length (digits 10 n) - 1]

onlyLongerElems n = filter (\xs -> length xs >= 8) $ replaceIntOverSubsequences n

problem51 = mapM_ print $
  take 10 $ filter (not . null) $
  map (onlyLongerElems . fromIntegral) primes
