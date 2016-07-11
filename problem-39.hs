-- Integer right triangles
-- Problem 39

-- If p is the perimeter of a right angle triangle with integral
-- length sides, {a,b,c}, there are exactly three solutions for p =
-- 120.

-- {20,48,52}, {24,45,51}, {30,40,50}

-- For which value of p ≤ 1000, is the number of solutions maximised?

import qualified Data.Map as M
import Data.List (groupBy, maximumBy)
import Control.Applicative
import Control.Monad

type Tuple a = (a, a, a)

rightTriangles :: (Integral a) => [(a, a, a)]
rightTriangles = do
  a <- [1..1000]
  b <- [a..1000]
  let c = floor $ sqrt $ fromIntegral (a^2 + b^2)
  guard (a^2 + b^2 == c^2)
  return (a, b, c)

sumTuple (a, b, c) = a + b + c

-- measuredTriangles = map (\t -> (sumTuple t, t)) rightTriangles

groupByThis x y = sumTuple x == sumTuple y

grouped = groupBy groupByThis rightTriangles

bestGroup = maximumBy
  (\ts ts' -> compare (length ts) (length ts')) grouped

-- prepopulatedPerimeterMap :: (Enum a, Ord a, Num a) => M.Map a [b]
-- prepopulatedPerimeterMap = M.fromList $ zip [1..1000] $ repeat []

-- adjustMap :: Ord k => (k, Tuple a) -> M.Map k [Tuple a] -> M.Map k [Tuple a]
-- adjustMap (p, t@(a,b,c)) perimeterMap = M.adjust (t:) p perimeterMap

-- fullMapToList :: [(Int, [Tuple Int])]
-- fullMapToList = M.toList $ foldr
--   adjustMap prepopulatedPerimeterMap measuredTriangles

-- go = (\(p', ts) (p, l) -> let l' = length ts in
--        if length ts > l then (p', l') else (p, l))

-- -- foldl :: Foldable t => (b -> a -> b) -> b -> t a -> b
-- problem39 = foldr go
--   (0, 0) fullMapToList

