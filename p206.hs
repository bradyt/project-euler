-- Concealed Square
-- Problem 206

-- Find the unique positive integer whose square has the form
-- 1_2_3_4_5_6_7_8_9_0,
-- where each “_” is a single digit.

import Data.Digits
import Data.List
import Control.Monad

a :: Integral a => a
a = fromIntegral $ floor $ sqrt 1020304050607080900

b :: Integral a => a
b = fromIntegral $ floor $ sqrt 1929394959697989990

nthDigit :: Integral a => a -> a -> a
nthDigit n x = div x (10^n) `mod` 10

nthDigitM :: Integral a => a -> a -> a -> Bool
nthDigitM n m = (==m) . (nthDigit n)

concatSqr :: Integral a => [a] -> a
concatSqr = (^2) . (unDigits 10)

guarded = do
  x0 <- [0..9]
  guard (nthDigitM 0 0 (x0^2))
  x1 <- [0..9]
  x2 <- [0..9]
  guard (nthDigitM 2 9 (concatSqr [x2,x1,x0]))
  x3 <- [0..9]
  x4 <- [0..9]
  guard (nthDigitM 4 8 (concatSqr [x4,x3,x2,x1,x0]))
  x5 <- [0..9]
  x6 <- [0..9]
  guard (nthDigitM 6 7 (concatSqr [x6,x5,x4,x3,x2,x1,x0]))
  x7 <- [0..9]
  x8 <- [0..9]
  guard (nthDigitM 8 6 (concatSqr [x8,x7,x6,x5,x4,x3,x2,x1,x0]))
  x9 <- [0..9]
  guard ((<=1389026623) $ unDigits 10 [x9,x8,x7,x6,x5,x4,x3,x2,x1,x0])
  guard (nthDigitM 10 5 (concatSqr [x9,x8,x7,x6,x5,x4,x3,x2,x1,x0]))
  guard (nthDigitM 12 4 (concatSqr [x9,x8,x7,x6,x5,x4,x3,x2,x1,x0]))
  guard (nthDigitM 14 3 (concatSqr [x9,x8,x7,x6,x5,x4,x3,x2,x1,x0]))
  guard (nthDigitM 16 2 (concatSqr [x9,x8,x7,x6,x5,x4,x3,x2,x1,x0]))
  guard (nthDigitM 18 1 (concatSqr [x9,x8,x7,x6,x5,x4,x3,x2,x1,x0]))
             
  return $ unDigits 10 [x9,x8,x7,x6,x5,x4,x3,x2,x1,x0]

p206 = (^2) $ head guarded
