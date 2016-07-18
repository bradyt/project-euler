-- Pandigital multiples
-- Problem 38

-- Take the number 192 and multiply it by each of 1, 2, and 3:

--     192 × 1 = 192
--     192 × 2 = 384
--     192 × 3 = 576

-- By concatenating each product we get the 1 to 9 pandigital,
-- 192384576. We will call 192384576 the concatenated product of 192
-- and (1,2,3)

-- The same can be achieved by starting with 9 and multiplying by 1,
-- 2, 3, 4, and 5, giving the pandigital, 918273645, which is the
-- concatenated product of 9 and (1,2,3,4,5).

-- What is the largest 1 to 9 pandigital 9-digit number that can be
-- formed as the concatenated product of an integer with (1,2, ... ,
-- n) where n > 1?

import Data.Digits

makeCandidates :: Integral a => [a]
makeCandidates = [1..9999]

makeNTuples :: Integral a => [[a]]
makeNTuples = map (enumFromTo 1) [2..9]

multiplyThem :: Integral a => [[a]]
multiplyThem = [ map (*c) t | c <- makeCandidates, t <- makeNTuples ]

spreadIntegers :: Integral a => [a] -> [a]
spreadIntegers = concatMap (digits 10)

hasAllNine :: (Enum a, Eq a, Num a) => [a] -> Bool
hasAllNine ns = all (flip elem ns) [1..9]

problem38 :: Integral a => a
problem38 =
  unDigits 10 $ maximum $
  filter hasAllNine $
  filter ((==9) . length) $
  map spreadIntegers multiplyThem
