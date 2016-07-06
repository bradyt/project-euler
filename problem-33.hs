-- Digit cancelling fractions
-- Problem 33

-- The fraction 49/98 is a curious fraction, as an inexperienced
-- mathematician in attempting to simplify it may incorrectly believe
-- that 49/98 = 4/8, which is correct, is obtained by cancelling the
-- 9s.

-- We shall consider fractions like, 30/50 = 3/5, to be trivial
-- examples.

-- There are exactly four non-trivial examples of this type of
-- fraction, less than one in value, and containing two digits in the
-- numerator and denominator.

-- If the product of these four fractions is given in its lowest
-- common terms, find the value of the denominator.

import Data.Ratio

find :: (Int, Int) -> Maybe [Ratio Int]
find (m, n) = undefined

makeElem (m, n) i = [ (10*i + m) % (10*i + n)
                    , (10*i + m) % (10*n + i)
                    , (10*m + i) % (10*i + n)
                    , (10*m + i) % (10*n + i) ]


makeElems (m, n) = concatMap (makeElem (m, n)) [1..9]

makeRatioAndCandidateRatios :: (Int, Int) -> (Ratio Int, [Ratio Int])
makeRatioAndCandidateRatios (m, n) = (m % n, makeElems (m, n))

returnGoodCandidates :: Eq a => (a, [a]) -> [a]
returnGoodCandidates (x, xs) = filter (==x) xs

takePairGiveGoodRatios :: (Int, Int) -> [Ratio Int]
-- takePairGiveGoodRatios = undefined
takePairGiveGoodRatios = 
  returnGoodCandidates . makeRatioAndCandidateRatios

array = [ (m, n) | m <- [1..9], n <- [1..9] ]

getGoods = map takePairGiveGoodRatios array
