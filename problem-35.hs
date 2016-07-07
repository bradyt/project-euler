-- Circular primes
-- Problem 35

-- The number, 197, is called a circular prime because all rotations
-- of the digits: 197, 971, and 719, are themselves prime.

-- There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17,
-- 31, 37, 71, 73, 79, and 97.

-- How many circular primes are there below one million?

import Math.NumberTheory.Primes
import Data.Char (digitToInt)
import Data.Char (intToDigit)

-- onlyThese :: [Int]
onlyThese k = map fromIntegral $ takeWhile (<10^k) primes

rotateList :: [a] -> [a]
rotateList (x:xs) = xs ++ [x]

-- intToList :: Integral a => a -> [a]
-- intToList = (map digitToInt) . show

-- listToInt :: Integral a => a -> [a]
-- listToInt xs = read $ map intToDigit $ fromIntegral xs

intToList :: Int -> [Int]
intToList = (map digitToInt) . show

listToInt :: [Int] -> Int
listToInt xs = read $ map intToDigit xs

rotateInt :: Int -> Int
rotateInt = listToInt . rotateList . intToList

-- checkIfCircularPrime :: Int -> Bool
checkIfCircularPrime k p = go p p
  where go n p
          | m == p             = True
          | m `elem` (onlyThese k) = go m p
          | otherwise          = False
          where m = rotateInt n

problem35 k = length $ filter (checkIfCircularPrime k) $ onlyThese k
