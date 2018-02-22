module P042 where

-- Coded triangle numbers
-- Problem 42

-- The nth term of the sequence of triangle numbers is given by, tn =
-- ½n(n+1); so the first ten triangle numbers are:

-- 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

-- By converting each letter in a word to a number corresponding to
-- its alphabetical position and adding these values we form a word
-- value. For example, the word value for SKY is 19 + 11 + 25 = 55 =
-- t10. If the word value is a triangle number then we shall call the
-- word a triangle word.

-- Using words.txt (right click and 'Save Link/Target As...'), a 16K
-- text file containing nearly two-thousand common English words, how
-- many are triangle words?

import Data.Char
import Text.CSV

fileName = "words.txt"

-- words ==> scores ==> filter for triangle numbers ==> length

charScore = (subtract 64) . ord

wordScore = sum . (map charScore)

t n = n * (n+1) `div` 2

isTriangleWord s = let score = wordScore s
                   in go score 1
  where go s n
          | s < tn    = False
          | s == tn   = True
          | otherwise = go s (n+1)
          where tn = t n

p042 :: IO Int
p042 = do
  Right csvResult <- parseCSVFromFile "../p042_words.txt"
  let n = length $ filter isTriangleWord $ head csvResult
  pure n

main :: IO ()
main = p042 >>= print
