
import Data.Digits

isPalindromicBase b n = xs == reverse xs
  where xs = digits b n

isPalindromicBoth n =
  isPalindromicBase 10 n && isPalindromicBase 2 n

problem36 = sum $ filter isPalindromicBoth [1..10^6-1]
