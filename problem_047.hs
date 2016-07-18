module Problem_47 (main47) where

-- Distinct primes factors
-- Problem 47

-- The first two consecutive numbers to have two distinct prime
-- factors are:

-- 14 = 2 × 7
-- 15 = 3 × 5

-- The first three consecutive numbers to have three distinct prime
-- factors are:

-- 644 = 2² × 7 × 23
-- 645 = 3 × 5 × 43
-- 646 = 2 × 17 × 19.

-- Find the first four consecutive integers to have four distinct
-- prime factors. What is the first of these numbers?

-- outline
-- A_{i,j,k,l}

import Math.NumberTheory.Primes
import qualified Data.IntSet as I
import qualified Data.Map as M
-- import Data.List (sort, nub)
-- import Control.Monad.Trans.State

simplex4 :: (Enum t, Num t) => t -> [(t, t, t, t)]
simplex4 s = [ (i, a, j, s-i-a-j) | i <- [0..s]
                                  , a <- [1..s-i]
                                  , j <- [i+1..s-i-a-1] ]

simplex6 ::  (Enum t, Num t) => t -> [(t, t, t, t, t, t)]
simplex6 s = [ (i, a, j, b, k, s-i-a-j-b-k)
              | i <- [0..s]
              , a <- [1..s-i]
              , j <- [i+1..s-i-a-1]
              , b <- [1..s-i-a-j]
              , k <- [j+1..s-i-a-j-b-1] ]

simplex8 ::  (Enum t, Num t) => t -> [(t, t, t, t, t, t, t, t)]
simplex8 s = [ (i, a, j, b, k, c, l, s-i-a-j-b-k-c-l)
             | i <- [0..s]
             , a <- [1..s-i]
             , j <- [i+1..s-i-a-1]
             , b <- [1..s-i-a-j]
             , k <- [j+1..s-i-a-j-b-1]
             , c <- [1..s-i-a-j-b-k]
             , l <- [k+1..s-i-a-j-b-k-c-1] ]

storedPrimes = M.fromList $ zip [0..] primes

primeList = M.empty

-- getPrime :: (Integral a, Integral b) => a -> b
-- getPrime n = case (M.lookup n Math.NumberTheory.Primes.primeList) of
--   Just p -> p
--   Nothing -> 2

filterForNPrimes n = (==n) . length . factorise

comp :: (Integral b, Integral a) => a -> b -> Integer
comp i n = (^n) $ primes !! (fromIntegral i)

tuplesToComposites4 = \(i, a, j, b)
                      -> (comp i a) * (comp j b)
tuplesToComposites6 = \(i, a, j, b, k, c)
                      -> (comp i a) * (comp j b) * (comp k c)
tuplesToComposites8 = \(i, a, j, b, k, c, l, d)
                      -> (comp i a) * (comp j b) * (comp k c) * (comp l d)

simplexOfComposites 2 = map tuplesToComposites4 . simplex4 . fromIntegral
simplexOfComposites 3 = map tuplesToComposites6 . simplex6 . fromIntegral
simplexOfComposites 4 = map tuplesToComposites8 . simplex8 . fromIntegral

dim = 2

makeNet dim = I.fromList . (map fromIntegral) . (simplexOfComposites dim)

loopOverCandidates :: Int -> Int -> Int -> I.IntSet -> [Int]
loopOverCandidates d n i nets 
  -- | i < 3     = loopOverCandidates d n 3 netsMore
  | netsBool  = n : loopOverCandidates d (n+1) i netsMore
  | otherwise = case (loopThroughNets d n i netsMore) of
      (True, i, nets')  -> n : loopOverCandidates d (n+1) i nets'
      (False, i, nets') -> loopOverCandidates d (n+1) i nets'
  where (_, netsBool, netsMore) = I.splitMember n nets

loopThroughNets :: Int -> Int -> Int -> I.IntSet -> (Bool, Int, I.IntSet)
loopThroughNets d n i nets
  | I.null net     = loopThroughNets d n (i+1) nets'
  | netBool        = (True,  i, nets')
  | I.null netLess = (False, i, nets')
  | otherwise      = loopThroughNets d n (i+1) nets'
  where net = makeNet d i
        (netLess, netBool, netMore) = I.splitMember n net
        nets' = I.union nets netMore

findConsecutives n (m:ms) = if nextIConsecutive n (m:ms)
                           then m
                           else findConsecutives n ms

nextIConsecutive i (x:xs) = all (\j -> (==(x+j+1)) $ xs !! j) [0..i-2]

main47 = take 82 $ loopOverCandidates 2 0 0 I.empty

-- factorList :: [Integer] -> [[(Integer, Int)]]
-- factorList xs = map factorise xs

-- two = filter (\xs -> length xs == 2) $ map factorise [2..]

-- tupleToList (x, y) = [x, y]

-- byTwos = zip [1..] [2..]

-- areTwos xy = all factorsToTwoPrimes xy

-- factorsToTwoPrimes = (==2) . length . factorise

