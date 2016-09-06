-- Largest palindrome product
-- Problem 4

-- A palindromic number reads the same both ways. The largest
-- palindrome made from the product of two 2-digit numbers is 9009 =
-- 91 × 99.

-- Find the largest palindrome made from the product of two 3-digit
-- numbers.

isPalindromic :: Int -> Bool
isPalindromic n = show n == (reverse $ show n)

threeDigits :: (Num a, Enum a) => [a]
threeDigits = [100..999]

products :: [Int] -> [Int]
products xs = [ x*y | x <- xs, y <- xs ]

problem4 :: Int
problem4 = maximum $ filter isPalindromic $ products threeDigits

main = print problem4
