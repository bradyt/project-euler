-- Goldbach's other conjecture
-- Problem 46

-- It was proposed by Christian Goldbach that every odd composite
-- number can be written as the sum of a prime and twice a square.

-- 9  = 7  + 2×1^2
-- 15 = 7  + 2×2^2
-- 21 = 3  + 2×3^2
-- 25 = 7  + 2×3^2
-- 27 = 19 + 2×2^2
-- 33 = 31 + 2×1^2

-- It turns out that the conjecture was false.

-- What is the smallest odd composite that cannot be written as the
-- sum of a prime and twice a square?

import qualified Data.IntSet as I
import Math.NumberTheory.Primes (primes, isPrime)
import Data.List (sort, nub)

generateNet :: (Int, Int) -> Int
generateNet (i, j) = fromIntegral $
  (primes !! (fromIntegral i)) + 2 * (fromIntegral j)^2

oddComps :: [Int]
oddComps = map fromIntegral $ filter (not . isPrime) [3,5..]

kthSlice :: Int -> [(Int, Int)]
kthSlice k = [ (k-i, i) | i <- [0..k] ]

checkNetSlice :: Int -> Int -> Either Int [Int]
checkNetSlice fish k =
  let netSlice = nub $ sort $ map generateNet $ kthSlice k
  in if fish < head netSlice
     then Left fish
     else Right $ dropWhile (<fish) netSlice

escapedFish :: Int
escapedFish = checkFish 0 I.empty 0

checkFish :: Int -> I.IntSet -> Int -> Int
checkFish f netSlack s =
  let fish = oddComps !! f
  in if fish `I.member` netSlack
     then checkFish (f+1) netSlack s
     else
       case (checkNetSlice fish s) of
         Left fish' -> fish'
         Right netSlack' -> checkFish f (I.union netSlack $ I.fromList netSlack') (s+1)

-- main = print escapedFish
main = print "4 seconds"
