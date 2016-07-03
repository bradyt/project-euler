-- Lexicographic permutations
-- Problem 24

-- A permutation is an ordered arrangement of objects. For example,
-- 3124 is one possible permutation of the digits 1, 2, 3 and 4. If
-- all of the permutations are listed numerically or alphabetically,
-- we call it lexicographic order. The lexicographic permutations of
-- 0, 1 and 2 are:

-- 012   021   102   120   201   210

-- What is the millionth lexicographic permutation of the digits 0, 1,
-- 2, 3, 4, 5, 6, 7, 8 and 9?

import Data.List ((\\))
import Control.Applicative

gen = [123456789..]

-- distinctElements :: Eq a => [a] -> Bool
-- distinctElements []     = True
-- distinctElements (x:xs) = x `notElem` xs && distinctElements xs

allNine :: [Char] -> Bool
allNine s = and $ (fmap . flip elem) s ['1'..'9']

problem24 k = (filter allNine $ map show gen) !! (10^k)

allTwo :: [Char] -> Bool
allTwo s = and $ (fmap . flip elem) s ['1'..'2']

nextPermutation :: [Int] -> [Int]
nextPermutation xs = undefined

-- go [0,1,2] -> 0 : go [1,2] -> 0 : [2,1]
-- go [0,2,1] -> 0 : 

isDecreasing :: Ord a => [a] -> Bool
isDecreasing [] = True
isDecreasing [x] = True
isDecreasing (x:y:ys) = x > y && isDecreasing (y:ys)

-- work on the reverse!
-- looking for last ... a < b > c > d > ... > z
-- reverse the list, looking for z < ... d < c < b > a ...

-- that is, first decrease in element, then replace with minimum
-- value, i.e., first value



factorial :: Integral a => a -> a
factorial n = product [1..n]

-- build :: (Int, [Int], [Int]) -> (Int, [Int], [Int])


first2 = 10^6 - 2 * factorial 9
-- 2 & 013456789

second6 = first2 - 6 * factorial 8
-- 27 & 01345689

third6 = second6 - 6 * factorial 7
-- 278 & 0134569

fourth2 = third6 - 2 * factorial 6
-- 2783 & 014569

fifth5 = fourth2 - 5 * factorial 5
-- 27839 & 01456

sixth1 = fifth5 - 1 * factorial 4
-- 278391 & 0456

seventh1 = sixth1 - 2 * factorial 3
-- 2783914 & 056

eighth2 = seventh1 - 1 * factorial 2
-- 27839146 & 05

-- 2783914605
-- 1672803549

-- -- leftover source avail mult ==> leftover
-- leftover :: Int -> Int -> Int -> Int
-- leftover source avail mult = source - mult * (factorial avail)

-- fitAndLeftover 10^6 9 ==> (2, 274240)
fitAndLeftover :: Integral a => a -> a -> (a, a)
fitAndLeftover pagesLeft numberAvail = divMod pagesLeft $ factorial numberAvail

takeIth :: Int -> [a] -> (a, [a])
takeIth n xs = (z, ys ++ zs)
  where (ys, (z:zs)) = splitAt n xs

nextElem :: (Integral a, Integral b) => a -> [b] -> (b, a, [b])
nextElem pages elems = (accrue, pages', elems')
  where (pages', index) = pagesAndIndex pages elems
        (accrue, elems') = takeIth (fromIntegral index) elems

pagesAndIndex :: (Integral a) => a -> [b] -> (a, a)
pagesAndIndex pages elems =
  divMod pages $ factorial $ fromIntegral $ length elems

generateElems :: (Integral a, Integral b) => a -> [b] -> [b]
generateElems pages elems = go pages elems
  where go 0 elems = elems
        go pages elems = a : go pages' elems'
          where (a, pages', elems') = nextElem pages elems
