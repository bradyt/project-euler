-- Cubic permutations
-- Problem 62

-- The cube, 41063625 (345^3), can be permuted to produce two other
-- cubes: 56623104 (384^3) and 66430125 (405^3). In fact, 41063625 is
-- the smallest cube which has exactly three permutations of its
-- digits which are also cube.

-- Find the smallest cube for which exactly five permutations of its
-- digits are cube.

import Data.Digits (digits)
import Data.List (sort, group)

cubeList :: [Int] -> [Int]
cubeList = map (^3)

digitsAndSort :: [Int] -> [[Int]]
digitsAndSort = sort . map (sort . digits 10)

-- findFives :: [Int] -> [Int]
findFives xs = filter ((==5) . length) $ group xs

someNumbers n = (\x -> [10^x..10^(x+1)]) n

-- [[[0,1,2,3,3,4,5,5,6,7,8,9],[0,1,2,3,3,4,5,5,6,7,8,9],[0,1,2,3,3,4,5,5,6,7,8,9],[0,1,2,3,3,4,5,5,6,7,8,9],[0,1,2,3,3,4,5,5,6,7,8,9]]
--   , [[0,1,2,3,3,4,5,6,6,7,8,9],[0,1,2,3,3,4,5,6,6,7,8,9],[0,1,2,3,3,4,5,6,6,7,8,9],[0,1,2,3,3,4,5,6,6,7,8,9],[0,1,2,3,3,4,5,6,6,7,8,9]]]

candidates :: Num a => [[a]]
candidates = [ [0,1,2,3,3,4,5,5,6,7,8,9]
             , [0,1,2,3,3,4,5,6,6,7,8,9] ]


getSmallest =
  -- take 5 $ 
  -- filter (\x -> (sort . digits 10 x) `elem` candidates) $
  filter ((`elem` candidates) . sort . digits 10) $ cubeList $ someNumbers 3
