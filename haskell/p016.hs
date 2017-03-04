-- Power digit sum
-- Problem 16

-- 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

-- What is the sum of the digits of the number 2^1000?

-- import Data.Char
-- import Data.List

addDigits :: Integer -> Int
addDigits n = go n 0
  where go :: Integer -> Int -> Int
        go 0 s = s
        go n' s =
          let (q, r) = divMod n' 10
          in go q (s + (fromInteger r))
              
problem16 :: Int
problem16 = addDigits $ 2^1000

main = print problem16
