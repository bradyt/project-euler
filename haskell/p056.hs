-- Powerful digit sum
-- Problem 56

-- A googol (10^100) is a massive number: one followed by one-hundred
-- zeros; 100^100 is almost unimaginably large: one followed by
-- two-hundred zeros. Despite their size, the sum of the digits in
-- each number is only 1.

-- Considering natural numbers of the form, a^b, where a, b < 100, what
-- is the maximum digital sum?

import Data.Digits (digits)

p056 :: Integer
p056 = maximum $ map (sum . digits 10) $ do a <- [1..99]
                                            b <- [1..99]
                                            return $ a^b

main :: IO ()
main = print p056
