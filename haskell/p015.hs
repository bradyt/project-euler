-- Lattice paths
-- Problem 15

-- Starting in the top left corner of a 2×2 grid, and only being able
-- to move to the right and down, there are exactly 6 routes to the
-- bottom right corner.

-- How many such routes are there through a 20×20 grid?

import Data.Monoid

choose n 0 = 1
choose 0 k = 0
choose n k = choose (n-1) (k-1) * n `div` k

main = print $ sum $ map ((^2) . choose 20) [0..20]
