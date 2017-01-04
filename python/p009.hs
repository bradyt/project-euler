-- Special Pythagorean triplet
-- Problem 9

-- A Pythagorean triplet is a set of three natural numbers, a < b < c,
-- for which,
-- a2 + b2 = c2

-- For example, 32 + 42 = 9 + 16 = 25 = 52.

-- There exists exactly one Pythagorean triplet for which a + b + c =
-- 1000.
-- Find the product abc.

problem9 :: Integral a => a
problem9 = head [ x*y*z | x <- [1..1000]
                        , y <- [x+1..1000]
                        , let z = 1000 - x - y
                        , x^(2::Int) + y^(2::Int) == z^(2::Int) ]

main = print problem9
