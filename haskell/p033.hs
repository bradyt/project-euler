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

makePerm :: (Int, Int) -> Int -> [[Int]]
makePerm (m, n) i = [ [i, m, i, n]
                    , [i, m, n, i]
                    , [m, i, i, n]
                    , [m, i, n, i] ]

makeRatio :: [Int] -> Ratio Int
makeRatio [ p, q, r, s ] = (10*p + q) % (10*r + s)

makePerms :: (Int, Int) -> [[Int]]
makePerms (m, n) = concatMap (makePerm (m, n)) [1..9]

checkPerms :: (Int, Int) -> [Int] -> Bool
checkPerms (m, n) ps = m % n == makeRatio ps

checkForEachPair :: (Int, Int) -> [[Int]]
checkForEachPair (m, n) = filter (checkPerms (m, n)) $ makePerms (m, n)

array :: [(Int, Int)]
array = [ (m, n) | m <- [1..9], n <- [1..9], m < n ]

winners :: [[Int]]
winners = concatMap checkForEachPair array

result :: Ratio Int
result = product $ map makeRatio winners

-- main = print problem32
main = print $ denominator result
