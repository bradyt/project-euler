-- Longest Collatz sequence
-- Problem 14

-- The following iterative sequence is defined for the set of positive
-- integers:

-- n → n/2 (n is even)
-- n → 3n + 1 (n is odd)

-- Using the rule above and starting with 13, we generate the
-- following sequence:
-- 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

-- It can be seen that this sequence (starting at 13 and finishing at
-- 1) contains 10 terms. Although it has not been proved yet (Collatz
-- Problem), it is thought that all starting numbers finish at 1.

-- Which starting number, under one million, produces the longest
-- chain?

-- NOTE: Once the chain starts the terms are allowed to go above one
-- million.

nextValue :: Int -> Int
nextValue n = if even n
              then n `div` 2
              else 3*n+1

propogate :: Int -> Int
propogate n = go (n, 1)
  where go (1, l) = l
        go (m, l) = go (nextValue m, l+1)

findMax :: Int -> Int
findMax k = go (1, 1, 1)
  where go (n, best, maxim)
          | n >= k              = best
          | propogate n > maxim = go (n+1, n, propogate n)
          | otherwise           = go (n+1, best, maxim)

main = print $ findMax 10^6
