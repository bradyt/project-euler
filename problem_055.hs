
import Data.Digits

lychrel :: Int -> Int -> Bool
lychrel 49 n = True
lychrel i n =
  let n' = reverseAndAdd n
  in if isPalindrome n'
     then False
     else lychrel (i+1) n'

reverseInt n = (unDigits 10) $ reverse $ (digits 10) n

reverseAndAdd n = n + reverseInt n

isPalindrome n = n == reverseInt n

problem55 = length $ filter (lychrel 0) [1..9999]
