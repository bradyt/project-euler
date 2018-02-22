module P099 where

-- Largest exponential
-- Problem 99

-- Comparing two numbers written in index form like 211 and 37 is not
-- difficult, as any calculator would confirm that 211 = 2048 < 37 =
-- 2187.

-- However, confirming that 632382^518061 > 519432^525806 would be much
-- more difficult, as both numbers contain over three million digits.

-- Using base_exp.txt (right click and 'Save Link/Target As...'), a
-- 22K text file containing one thousand lines with a base/exponent
-- pair on each line, determine which line number has the greatest
-- numerical value.

-- NOTE: The first two lines in the file represent the numbers in the
-- example given above.

-- compare (632382^518061) (519432^525806)

import Data.List.Split (splitOn)

main = print =<< p099

p099 :: IO Int
p099 = do file <- readFile "../p099_base_exp.txt"
          let lines' = lines file
              pairs = map lineToPair lines'
              doubles = map pairToDouble pairs
              tuples = zip doubles [1..]
          pure $ snd $ maximum tuples

lineToPair :: String -> [Int]
lineToPair = map read . splitOn ","

pairToDouble :: [Int] -> Double
pairToDouble [x, y] = log (fromIntegral x) * (fromIntegral y)

lines'' = [ "519432,525806"
          , "632382,518061"
          , "78864,613712"
          , "466580,530130"
          , "780495,510032" ]

