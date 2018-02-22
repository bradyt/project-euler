module P036 where


import Data.Digits

isPalindromicBase b n = xs == reverse xs
  where xs = digits b n

isPalindromicBoth n =
  isPalindromicBase 10 n && isPalindromicBase 2 n

-- p036 = sum $ filter isPalindromicBoth [1..10^6-1]

-- main = print p036
main = print p036
p036 = "4 seconds"
