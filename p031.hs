-- Coin sums
-- Problem 31

-- In England the currency is made up of pound, £, and pence, p, and
-- there are eight coins in general circulation:

--     1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).

-- It is possible to make £2 in the following way:

--     1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p

-- How many different ways can £2 be made using any number of coins?

evaluate xs = sum $ zipWith (*) xs [200, 100, 50, 20, 10, 5, 2, 1]

hyperplane = [ [a, b, c, d, e, f, g] | a <- [0,1]
                                     , b <- [0..(200-200*a) `div` 100]
                                     , c <- [0..(200-200*a-100*b) `div` 50]
                                     , d <- [0..(200-200*a-100*b-50*c) `div` 20]
                                     , e <- [0..(200-200*a-100*b-50*c-20*d) `div` 10]
                                     , f <- [0..(200-200*a-100*b-50*c-20*d-10*e) `div` 5]
                                     , g <- [0..(200-200*a-100*b-50*c-20*d-10*e-5*f) `div` 2] ]

testEqualTo200 xs = (==200) $ evaluate xs

-- (1,0,0,0,0,0,0,0)
-- (0,2,0,0,0,0,0,0)
-- (0,1,2,0,0,0,0,0)
-- (0,1,1,2,0,1,0,0)

type TwoPound = Int
type OnePound = Int
type FiftyP = Int
type TwentyP = Int
type TenP = Int
type FiveP = Int
type TwoP = Int
type OneP = Int

data Purse =
  Purse TwoPound OnePound FiftyP TwentyP TenP FiveP TwoP OneP
  deriving (Eq, Show)
