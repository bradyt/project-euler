-- Smallest multiple
-- Problem 5

-- 2520 is the smallest number that can be divided by each of the
-- numbers from 1 to 10 without any remainder.

-- What is the smallest positive number that is evenly divisible by
-- all of the numbers from 1 to 20?

-- contextAll :: (Int -> Bool) -> [Int] -> Bool
-- contextAll = all

-- contextFoldl :: (Int -> Int -> Int) -> Int -> [Int] -> Int
-- contextFoldl = foldl

-- -- this function will take [1..20] and 2432902008176640000, and return true
-- divByAll :: Int -> [Int] -> Bool
-- divByAll m ns = all (\n -> m `divByN` n) ns

-- lCM :: [Int] -> Int
-- lCM ns = minimum $ filter (`divByAll` ns) $ [1..10000000] 

-- problem5 :: Int
-- problem5 = lCM [1..20]

-- A simple algorithm

-- This method works as easily for finding the LCM of several
-- integers.

-- Let there be a finite sequence of positive integers X = (x1, x2,
-- ..., xn), n > 1. The algorithm proceeds in steps as follows: on
-- each step m it examines and updates the sequence X(m) = (x1(m),
-- x2(m), ..., xn(m)), X(1) = X, where X(m) is the mth iteration of X,
-- i.e. X at step m of the algorithm, etc. The purpose of the
-- examination is to pick the least (perhaps, one of many) element of
-- the sequence X(m). Assuming xk0(m) is the selected element, the
-- sequence X(m+1) is defined as

--     xk(m+1) = xk(m), k ≠ k0
--     xk0(m+1) = xk0(m) + xk0(1).

-- In other words, the least element is increased by the corresponding
-- x whereas the rest of the elements pass from X(m) to X(m+1)
-- unchanged.

-- The algorithm stops when all elements in sequence X(m) are equal.
-- Their common value L is exactly LCM(X).

-- (2,3,4) -> (4,3,4) -> (4,6,4) -> (6,6,8) -> (4,9,8) -> (4,9,12)
-- -> ... -> (12,12,12)

-- ([2,3,4], [2,3,4])
-- ([2,3,4], [4,6,4])
-- ([2,3,4], [6,6,8])
-- ([2,3,4], [8,9,8])
-- ([2,3,4], [10,9,12])
-- ([2,3,4], [12,12,12])

-- ([2,3,4], [4,6,4], False) -> [6,6,8]

-- take indexes of elements that are not maximum value

-- [4,6,4] -> [0,2]

-- [4,6,4] -> [Maybe 0, Nothing, Maybe 2]

-- [4,6,4] -length-> 3 -maximum-> 6 ->

data LCMAlgo =
  LCMAlgo { original :: [Int]
          , current :: [Int]
          , len :: Int
          , allEqB :: Bool
          }
  deriving Show

lcmalgo :: LCMAlgo
lcmalgo = LCMAlgo [2,3,4] [4,6,4] 3 True


-- lCM xs = if allEqual xs then head xs
--          else incrementElements xs xs

-- incrementElements :: [Int] -> [Int] -> [Int]
-- incrementElements (x:y:ys) = undefined


-- allEqual :: Eq a => [a] -> Bool
-- allEqual [] = True
-- allEqual [x] = True
-- allEqual (x:y:ys)
--   | x == y = allEqual (y:ys)
--   | otherwise = False

-- -- getIndices [2,3,6,4,6] --> [0,1,3]
-- getIndices :: [Int] -> [Int]
-- getIndices xs = [ i | i <- [0..(length xs)-1], xs !! i < maximum xs ]

-- getIndicesR :: [(Int, Int)] -> [Int]
-- getIndicesR = getIndices . map snd

-- -- update [(2,4),(3,6),(4,4)] [0,2] --> [(2,6),(3,6),(4,8)]
-- update :: [(Int, Int)] -> [Int] -> [(Int, Int)]
-- update xys indices = [ let (x, y) = (xys !! i)
--                        in (x, go i x y)
--                      | i <- [0..(length xys)-1]
--                      ]
--   where go i x y =
--           if i `elem` indices then x + y else y

-- lCMRecursion :: [(Int, Int)] -> [Int] -> Int
-- lCMRecursion xys is =
--   let ys = map snd xys
--   in if allEqual ys
--      then head ys
--      else let xys' = update xys is
--               is' = getIndicesR xys'
--           in lCMRecursion xys' is'

-- lCM :: [Int] -> Int
-- lCM xs = lCMRecursion (zip xs xs) $ getIndices xs

-- problem5 :: Int
-- problem5 = lCM [1..20]

lCMList :: [Int] -> Int
lCMList [] = undefined
lCMList [x] = x
lCMList (x:y:ys) = lCMList (lCM x y : ys)

lCM :: Int -> Int -> Int
lCM x y = x * y `div` gCD x y

gCD :: Int -> Int -> Int
gCD x y
  | x == y = x
  | x < y  = gCD x (y-x)
  | x > y  = gCD (x-y) y
  | otherwise = undefined

-- main = print $ lCMList [1..20]
main = print "13 seconds"
