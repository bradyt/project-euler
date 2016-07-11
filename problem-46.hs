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

import qualified Data.Map as M
import Control.Monad (guard)
import Math.NumberTheory.Powers.Squares (isSquare)
import Math.NumberTheory.Primes
import Data.Maybe
import qualified Data.Set as S

-- outline of strategy

-- n = p + 2 * i ^ 2
-- i ^ 2 = (n - p) / 2

-- or, array on indices of p_i and (2*j^2)_j
-- and whenever you get to a number crossed out, make the next crossouts,
-- (p_i + 2*j^2, [(i, j)]) -> (i+1, j) and (i, j+1)

-- if an element is larger than the next smallest in array, update
-- array until equal or bigger. if bigger, we are done. else, update
-- array according to current match.

-- in more pseudocode style,
-- while composite > k, update array.
-- if composite < k, we have our counterexample
-- if composite == k, update array at composite

-- overall, if composite >= k, we will be updating at k.
-- only difference is, if composite == k, we go to next composite.

-- so let's write outline for updating at k.

-- at k, we have something like (k, [(i, j)]). for each (i, j), we
-- will update list with (i, j+1) and (i+1, j). 

-- so like k ==> [(i, j)] ==> (i, j) ==> [k', ((i', j'):)]

type Array k a = M.Map k (S.Set (a, a))

generateK :: Integer -> Integer -> Integer
generateK i j = fromIntegral $
  (primes !! (fromIntegral i)) + 2 * (fromIntegral j)^2

oddComposites :: [Integer]
oddComposites = map fromIntegral $ filter (not . isPrime) [3,5..]

initialArray :: Array Integer Integer
initialArray = M.singleton (generateK 0 0) (S.singleton (0, 0))

updateFromK :: Integer -> Array Integer Integer -> Array Integer Integer
updateFromK k array = foldr
  updateFromIJ (M.delete k array) $ fromJust $ M.lookup k array

updateFromIJ :: (Integer, Integer) -> Array Integer Integer -> Array Integer Integer
updateFromIJ (i, j) array =
  updateWithIJ (i, j + 1) $ updateWithIJ (i + 1, j) array

updateWithIJ :: (Integer, Integer) -> Array Integer Integer -> Array Integer Integer
updateWithIJ (i, j) array =
  M.insertWith (S.insert) (generateK i j) (i, j) array

searchForCounterexample = go 0 initialArray
  where go :: Integer -> Array Integer Integer -> Integer
        go i array =
          let k = fst $ M.findMin array
              comp = oddComposites !! (fromIntegral i)
          in if comp < k
             then comp
             else if comp > k
                  then go i $ updateFromK k array
                  else go (i+1) $ updateFromK k array
