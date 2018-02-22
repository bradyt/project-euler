module Util where

fib :: Integer -> Integer
fib 1 = 1
fib 2 = 1
fib n
  | odd n  = let m = (n + 1) `div` 2
             in (fib m)^2 + (fib $ m - 1)^2
  | even n = let m = n `div` 2
             in (2 * (fib $ m - 1) + (fib m)) * (fib m)
