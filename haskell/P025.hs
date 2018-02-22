module P025 where

-- 1000-digit Fibonacci number
-- Problem 25

-- The Fibonacci sequence is defined by the recurrence relation:

--     F_n = F_{n−1} + F_{n−2}, where F_1 = 1 and F_2 = 1.

-- Hence the first 12 terms will be:

--     F_1 = 1
--     F_2 = 1
--     F_3 = 2
--     F_4 = 3
--     F_5 = 5
--     F_6 = 8
--     F_7 = 13
--     F_8 = 21
--     F_9 = 34
--     F_10 = 55
--     F_11 = 89
--     F_12 = 144

-- The 12th term, F_12, is the first term to contain three digits.

-- What is the index of the first term in the Fibonacci sequence to
-- contain 1000 digits?

import Util (fib)

itsFibIsLarge :: Integer -> Bool
itsFibIsLarge = (>(10^999)) . fib

bisect :: Integral a => (a -> Bool) -> (a, a) -> (a, a)
bisect p (x, y) = if (p z)
                  then (x, z)
                  else (z, y)
  where z = midpoint x y
        midpoint = ((`div` 2) .) . (+)

findViaBisect :: Integral a => (a -> Bool) -> (a, a) -> a
findViaBisect p (x, y) = if p x
                         then x
                         else go (x, y)
  where go (x, y) = if y == x + 1
                    then y
                    else go $ bisect p (x, y)

power :: Integral a => (a -> Bool) -> a
power p = go p 0
  where go p n = if p (2^n)
                 then n
                 else go p $ n + 1

p025 :: Integer
p025 = findViaBisect itsFibIsLarge (1, 2^(power itsFibIsLarge))

main :: IO ()
-- main = print p025
main = print "3 seconds"
