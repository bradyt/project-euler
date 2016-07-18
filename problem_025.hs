
-- ϕ = (1 + √5) / 2
phi = (1+sqrt 5) / 2

-- n(F) = ⌊log_ϕ(F⋅√5 + 1/2)⌋ ≅ .2090n
index f = logBase phi (f*(sqrt 5) + (1/2))

-- F_n = ⌊(φⁿ/√5) + 1/2⌋
fibonacci n = floor $ phi^n / (sqrt 5) + 1 / 2

firstLarge = head $ filter (>10^1000) $ map fib [1..]

fib :: Integer -> Integer
fib 1 = 1
fib 2 = 1
fib n
  | odd n  = let m = (n + 1) `div` 2
             in (fib m)^2 + (fib $ m - 1)^2
  | even n = let m = n `div` 2
             in (2 * (fib $ m - 1) + (fib m)) * (fib m)

          
itsFibIsLarge :: Integer -> Bool
itsFibIsLarge n = (>(10^999)) $ fib n
