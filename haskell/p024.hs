-- Lexicographic permutations
-- Problem 24

-- A permutation is an ordered arrangement of objects. For example,
-- 3124 is one possible permutation of the digits 1, 2, 3 and 4. If
-- all of the permutations are listed numerically or alphabetically,
-- we call it lexicographic order. The lexicographic permutations of
-- 0, 1 and 2 are:

-- 012   021   102   120   201   210

-- What is the millionth lexicographic permutation of the digits 0, 1,
-- 2, 3, 4, 5, 6, 7, 8 and 9?

factorial :: Integral a => a -> a
factorial n = product [1..n]

start :: Integral a => Int -> [a]
start n = next n [0..9] []

next :: Int -> [a] -> [a] -> [a]
next _ [] ys = ys
next n xs ys = next m zs ws
  where (d, m) = divMod n $ sizeOfSubDicts xs
        (x, zs) = removeKth d xs
        ws = ys ++ [x]

sizeOfSubDicts :: [a] -> Int
sizeOfSubDicts = factorial . (subtract 1) . length

removeKth :: Int -> [a] -> (a, [a])
removeKth k xs = (r, ls ++ rs)
  where (ls, r:rs) = splitAt k xs

p024 :: String
p024 = concatMap show $ start $ 10^6 - 1

main :: IO ()
main = putStrLn p024
