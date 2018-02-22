module P022 where

-- Names scores
-- Problem 22

-- Using names.txt (right click and 'Save Link/Target As...'), a 46K
-- text file containing over five-thousand first names, begin by
-- sorting it into alphabetical order. Then working out the
-- alphabetical value for each name, multiply this value by its
-- alphabetical position in the list to obtain a name score.

-- For example, when the list is sorted into alphabetical order,
-- COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name
-- in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

-- What is the total of all the name scores in the file?

import Data.Char (ord)
import Text.CSV
import Data.List (sort)

-- ord 'A' = 65

nameValue :: [Char] -> Int
nameValue s = sum $ map ((subtract 64) . ord) s

mapListToNameScores :: [[Char]] -> [Int]
mapListToNameScores xs =
  [ (*) (i+1) $ nameValue $ xs !! i | i <- [0..(length xs) - 1] ]

mapUnsortedCSVToTotal :: CSV -> Int
mapUnsortedCSVToTotal csvInput =
  sum $ mapListToNameScores $ sort $ concat csvInput

p022 :: IO Int
p022 = do
  Right csvResult <- parseCSVFromFile "../p022_names.txt"
  let total = mapUnsortedCSVToTotal csvResult
  pure total

main :: IO ()
main = p022 >>= print
