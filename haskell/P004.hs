module P004 where

-- Largest palindrome product
-- Problem 4

-- A palindromic number reads the same both ways. The largest
-- palindrome made from the product of two 2-digit numbers is 9009 =
-- 91 × 99.

-- Find the largest palindrome made from the product of two 3-digit
-- numbers.

import Math.NumberTheory.Primes.Factorisation
import Data.Digits

isPalindromic :: Int -> Bool
isPalindromic n = digs == reverse digs
  where digs = digits 10 n

threeDigits :: (Num a, Enum a) => [a]
threeDigits = reverse [100..999]

products :: [Int] -> [Int]
products xs = [ x*y | x <- xs, y <- xs, x < y]

p004 :: Int
p004 = maximum . filter isPalindromic $ products threeDigits

main = print p004
