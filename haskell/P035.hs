module P035 where

-- Circular primes
-- Problem 35

-- The number, 197, is called a circular prime because all rotations
-- of the digits: 197, 971, and 719, are themselves prime.

-- There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17,
-- 31, 37, 71, 73, 79, and 97.

-- How many circular primes are there below one million?

import Math.NumberTheory.Primes
import qualified Data.Map as M
import Data.Digits (digits, unDigits)
import Data.List (sort, nub)

type Prime = Int
type Candidate = Int
type Array = M.Map Candidate ([Candidate], [Prime])

allRotations :: Integral a => a -> [a]
allRotations n = nub $ sort $ map (unDigits 10) $ go ms l
  where ms = digits 10 n
        l = length ms
        go :: (Integral a, Integral b) => [a] -> b -> [[a]]
        go _   0 = []
        go ms' i = ms' : go (take l $ drop 1 $ cycle ms') (i-1)

updateArray :: Prime -> Array -> Array
updateArray p map = let rots = allRotations p in
  if p == head rots
  then if length rots == 1
       then M.insert p ([0], [p]) map
       else M.insert (rots!!1) (drop 2 rots, [p]) map
  else if M.member p map
       then let Just (candidates, primes) = M.lookup p map
            in if null candidates
               then M.insert p ([0], p:primes) (M.delete p map)
               else let (c:cs) = candidates
                    in M.insert c (cs, p:primes) (M.delete p map)
       else map

arrayForOneMillion = foldl (flip updateArray) M.empty $
  takeWhile (<10^6) $ map fromIntegral primes
countForOneMillion = M.foldr (\(xs, ys) s -> if xs == [0] then s + length ys else s) 0
  arrayForOneMillion

-- main = print countForOneMillion
main = print p035
p035 = "5 seconds"
