-- Non-abundant sums
-- Problem 23

-- A perfect number is a number for which the sum of its proper
-- divisors is exactly equal to the number. For example, the sum of
-- the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which
-- means that 28 is a perfect number.

-- A number n is called deficient if the sum of its proper divisors is
-- less than n and it is called abundant if this sum exceeds n.

-- As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the
-- smallest number that can be written as the sum of two abundant
-- numbers is 24. By mathematical analysis, it can be shown that all
-- integers greater than 28123 can be written as the sum of two
-- abundant numbers. However, this upper limit cannot be reduced any
-- further by analysis even though it is known that the greatest
-- number that cannot be expressed as the sum of two abundant numbers
-- is less than this limit.

-- Find the sum of all the positive integers which cannot be written
-- as the sum of two abundant numbers.

import Data.Map (Map)
-- import qualified Data.Map as M
import Math.NumberTheory.Primes.Factorisation (divisors)
import Math.NumberTheory.Primes (isPrime)
import Control.Applicative
import Data.Maybe (fromJust)
import qualified Data.IntSet as IS
import Data.IntSet (IntSet)
import Control.Monad
import qualified Data.Vector.Unboxed.Mutable as M
import qualified Data.Vector.Unboxed as V
-- import Data.Vector.Unboxed (Vector)
import Control.Monad.ST
import Control.Monad

upperLimit = 28123
-- -- upperLimit = 20
  
isAbundant :: Integer -> Bool
isAbundant n = (> 2*n) $ sum $ divisors n

-- allAbundants :: Integral a => [a]
-- allAbundants = map fromIntegral $ filter isAbundant [1..upperLimit]

allAbundants :: Integral a => [a]
allAbundants = map fromIntegral $ filter isAbundant [1..upperLimit]
  where isAbundant n = (> 2*n) $ sum $ divisors n
        upperLimit = 28123

-- abundantMap :: Map Int Integer
-- abundantMap = M.fromList $ zip [0..] allAbundants

-- convertAbundantPtToSum :: (Int, Int) -> Integer
-- convertAbundantPtToSum (x, y) = fromJust $
--   (+) <$> (M.lookup x abundantMap) <*> (M.lookup y abundantMap)

-- abundantSumsArray :: Map Integer [(Int, Int)]
-- abundantSumsArray = M.fromList [ (convertAbundantPtToSum (i, i), [(i, i)])
--                                | i <- [0..(length allAbundants) - 1] ]

-- updateSumsFromPoint :: Map Integer [(Int, Int)] -> (Int, Int)
--                     -> Map Integer [(Int, Int)]
-- updateSumsFromPoint array (p1, p2)
--   | p2' < (length allAbundants) =
--       M.insertWith (++) (convertAbundantPtToSum (p1, p2')) [(p1, p2')] array
--   | otherwise                = array
--   where p2' = p2 + 1

-- -- want a function that takes a value, and updates the table
-- updateSumsFromSum :: Map Integer [(Int, Int)] -> Integer -> Map Integer [(Int, Int)]
-- updateSumsFromSum array sum =
--   case (M.lookup sum array) of
--     Nothing     -> array
--     Just points -> 
--       foldl updateSumsFromPoint (M.delete sum array) points

-- removeSums :: [Integer] -> [Integer]
-- removeSums xs = removeSumsRec xs abundantSumsArray

-- removeSumsRec :: [Integer] -> Map Integer [(Int, Int)] -> [Integer]
-- removeSumsRec [] _         = []
-- removeSumsRec (x:xs) array =
--   case (M.lookup x array) of
--     Nothing     -> x:removeSumsRec xs array
--     Just points -> removeSumsRec xs (foldl
--                                      updateSumsFromPoint
--                                      (M.delete x array) points)

-- problem23 = sum $ removeSums [1..upperLimit]

-- -- main = print problem23
-- -- main = print lengthProduct

-- lengthProduct = length apAbund

-- mapAbund = (+) <$> allAbundants

-- apAbund = mapAbund <*> allAbundants

-- -- $ length $ (+) <$> allAbundants <*> allAbundants

--   -- where reinsert :: Map Integer [(Integer, Integer)]
--   --                -> (Integer, Integer)
--   --                -> Map Integer [(Integer, Integer)]
--   --       reinsert array' (p1, p2) =
--   --         case (M.lookup (p2+1) abundantMap) of
--   --           Just nextAbundant -> 
--   --             M.insertWith (++) val [(p1, p2+1)] array'
--   --             where val = 
--   --                     (abundantMap M.! p1) +
--   --                     nextAbundant
--   --           Nothing -> array'

-- -- sieve :: [Integer] -> [Integer]
-- -- sieve ys = sieve' ys M.empty
-- --   where
-- --     sieve' []     _     = []
-- --     sieve' (x:xs) table =
-- --       case (M.lookup x table) of
-- --         Nothing    -> x : sieve' xs (M.insert (x*x) [x] table)
-- --         Just facts -> sieve' xs (foldl reinsert (M.delete x table) facts)
-- --       where
-- --         reinsert table' prime = M.insertWith (++) (x+prime) [prime] table'



-- We take a set of values, then the set of all sumPairs of these.
-- What's leftover, we want to add.

-- So, how do we get all sumPairs? We have 6965 values, so there are
-- 48511225 sums to consider. All the values below the max value, we
-- sum their complement.

-- I need some methodical way to traverse reasonably through the list.

-- Or brute force? What would brute force look like?

-- We simply generate all the sumPairs, of course on the triangle.

-- 

-- (12,12,24)
-- (12,18,30)
-- (12,20,32)
-- (18,12,30)
-- (18,18,36)
-- (18,20,38)
-- (20,12,32)
-- (20,18,38)
-- (20,20,40)


-- 20 32 38 40
-- 18 30 36
-- 12 24
-- +  12 18 20

them = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,
        18, 19, 20, 21, 22, 23, 25, 26, 27, 28, 29, 31, 33, 34, 35, 37, 39,
        41, 43, 45, 46, 47, 49, 51, 53, 55, 57, 59, 61, 63, 65, 67, 69, 71,
        73, 75, 77, 79, 81, 83, 85, 87, 89, 91, 93, 95, 97, 99, 101, 103,
        105, 107, 109]

this :: Integral a => [a]
this = [0..6000]

-- main = print mySize

-- mySize = IS.size $ IS.fromList $ liftM2 (+) [0..6000] [0..6000]

-- V.length $ (V.empty :: V.Vector Int)

someFunc :: V.Vector Float -> V.Vector Float -> Float
someFunc arrA arrB = runST $ do
        -- Obtain mutable copies of the arrays
        mA <- V.thaw arrA 
        mB <- V.thaw arrB
        (mA', mB') <- foldM op (mA, mB) [1..n-1] -- for(i = 1 ; i < n; i++)
        M.read mA' 0
 where
 n = min (V.length arrA) (V.length arrB)

 op (mA, mB) i = do
        forM_ [0..n-i-1] $ \j -> do
                v1 <- M.read mA j
                v2 <- M.read mB (j+1)
                M.write mB j (someFn i j v1 v2)
        return (mB, mA)

someFn i j f1 f2 = f1 + fromIntegral i + fromIntegral j - f2

-- main = print $ someFunc (V.fromList [1..10]) (V.fromList [0..9])
main = print $ V.length $ V.fromList $ liftM2 (+) [0..1500] [0..1500::Int]

