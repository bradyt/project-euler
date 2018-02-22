module P051 where

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
import Data.List (subsequences, (\\), groupBy, sortBy, maximumBy, nub)
import Math.NumberTheory.Logarithms (integerLogBase)
import Data.Function (on)
import Data.Maybe

-- outline
-- 1. for each make masks
-- 2. for each mask, replace in prime using some number

makeMasks :: Integer -> [[Int]]
makeMasks n = subsequences [0..fromIntegral (integerLogBase 10 n)]

-- replaceOver :: Integer -> [Int] -> Integer
-- replaceOver prime mask number = 

-- |replace 23 [0] 1 ==> Just 13
replace :: Integer -> [Int] -> Integer -> Maybe Integer
replace prime mask number =
  if isPrime result &&
     ((==) `on` (integerLogBase 10))
     result prime
  then Just
       result
  else Nothing
  where ns = digits 10 $ fromIntegral prime
        result = unDigits 10
          [ if i `elem` mask then number else ns !! i
          | i <- [0..length ns - 1] ]

replaces :: Integer -> [Int] -> [Integer]
replaces prime mask = nub . catMaybes $ map (replace prime mask) [0..9]

getBestReplacement :: Integer -> [Integer]
getBestReplacement prime = maximumBy (compare `on` length) .
  map (replaces prime) $ makeMasks prime

-- prime -> (prime, mask)               makeMasks
-- prime -> mask -> [Maybe numbers]     replace
-- prime -> count                       countPrimes
-- [prime] -> [(prime, count)]          counts

-- countPrimes :: Integer -> Int
countPrimes prime = let
  masks = makeMasks prime
  maskMap = replace prime <$> masks
  in maskMap
  -- let masks = makeMasks prime
  --     maskMap = replace prime <$> masks
  --     maybePrimes = maskMap <*> [0..9]
  -- in
  --   -- length $ filter isJust maybePrimes
  --   maybePrimes

p051' = head $ head $ dropWhile ((<8) . length) $
  map getBestReplacement primes

main = print p051
p051 = "31 seconds"

nDigitPrimes :: Integral a => a -> [a]
nDigitPrimes n = takeWhile (<10^n) . dropWhile (<10^(n-1)) $
  map fromIntegral primes

equalAllOn :: Integral a => [Int] -> [a] -> Bool
equalAllOn []     _  = True
equalAllOn (i:is) ns = all (==ns!!i) $ map (ns!!) is

equalEachOff :: Integral a => [Int] -> [a] -> [a] -> Bool
equalEachOff = on (==) . remove

remove :: [Int] -> [a] -> [a]
remove is = map snd . filter ((`notElem` is) . fst) . zip [0..]

-- subsequences [0,1] ==> [[],[0],[1],[0,1]]

sortByCommon :: Integral a => [Int] -> [[a]] -> [[a]]
sortByCommon is = sortBy (compare `on` remove is)

groupByCommon :: Integral a => [Int] -> [[a]] -> [[[a]]]
groupByCommon is = groupBy (equalEachOff is) . filter (equalAllOn is)

sortThenGroupByCommon :: Integral a => [[a]] -> [Int] -> [[[a]]]
sortThenGroupByCommon ps is = groupByCommon is . sortByCommon is $ ps

makeCases :: Integral a => a -> ([[a]], [[a]])
makeCases n = (map (digits 10) $ nDigitPrimes n, subsequences [0..n-1])

makeSets = uncurry (concatMap . sortThenGroupByCommon) . makeCases

tryTillM m = if length' == m
             then success
             else tryTillM (m+1)
  where length' = undefined
        success = undefined

testRun = map (digits 10) $ nDigitPrimes 2

sorted = sortByCommon [0] $ testRun

maximum' :: [[a]] -> [a]
maximum' = maximumBy (compare `on` length)

-- bestChain = maximum' $ concatMap (groupByCommon sortByCommon) $ subsequences [0,1]

-- head $ map (unDigits 10) $ maximum' $ concatMap (groupByCommon sorted) $ subsequences [0,1]

-- (sortByCommon [0]) testRun
-- filter (equalAllOn [0]) testRun
-- groupByCommon testRun [0]
-- mapM_ print $ groupByCommon testRun [0]


-- on :: (b -> b -> c) -> (a -> b) -> a -> a -> c

-- remove :: Integral a => [Int] -> [a] -> [a]

-- (==) :: Eq b => b -> b -> Bool

-- remove is :: Integral a => a -> b





isIntegralPrime :: Integral a => a -> Bool
isIntegralPrime = isPrime . fromIntegral

-- starThree = [ unDigits 10 [i, 3] | i <- [1..9] ]

replace' :: [a] -> [Int] -> a -> [a]
replace' ns is m =
  -- map (if i `elem` is then m else ns !! i) ns
  [ if i `elem` is then m else ns !! i
  | i <- [0..length ns - 1] ]

replaceIntAtIs :: Integral a => [a] -> [Int] -> [a]
replaceIntAtIs ns is = filter isIntegralPrime .
  map (unDigits 10) $ map (replace' ns is) [0..9]

replaceIntOverSubsequences n = map (replaceIntAtIs digs) $
  tail $ subsequences [0..length digs - 1]
  where digs = digits 10 n

onlyLongerElems n = filter ((>=8) . length) $
  replaceIntOverSubsequences n

-- p051 = mapM_ print $
--   take 10 $ filter (not . null) $
--   map (onlyLongerElems . fromIntegral) primes

-- main = print p051
-- p051 = "33 seconds"
