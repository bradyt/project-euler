-- Previous

-- Next
-- Self powers
-- Problem 48

-- The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

-- Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... +
-- 1000^1000.

p048 :: Integer
p048 = (`mod` 10^10) . sum $ map (\n -> n^n) [1..1000]

main :: IO ()
main = print p048
