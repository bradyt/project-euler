-- Coin sums
-- Problem 31

-- In England the currency is made up of pound, £, and pence, p, and
-- there are eight coins in general circulation:

--     1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).

-- It is possible to make £2 in the following way:

--     1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p

-- How many different ways can £2 be made using any number of coins?

hyperplane :: [()]
hyperplane = do a <- [0,200]
                b <- [0,100..200-a]
                c <- [0,50..200-a-b]
                d <- [0,20..200-a-b-c]
                e <- [0,10..200-a-b-c-d]
                f <- [0,5..200-a-b-c-d-e]
                g <- [0,2..200-a-b-c-d-e-f]
                return ()

p031 :: Int
p031 = length hyperplane

main :: IO ()
main = print p031
