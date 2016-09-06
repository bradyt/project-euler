-- Passcode derivation
-- Problem 79

-- A common security method used for online banking is to ask the user
-- for three random characters from a passcode. For example, if the
-- passcode was 531278, they may ask for the 2nd, 3rd, and 5th
-- characters; the expected reply would be: 317.

-- The text file, keylog.txt, contains fifty successful login
-- attempts.

-- Given that the three characters are always asked for in order,
-- analyse the file so as to determine the shortest possible secret
-- passcode of unknown length.

import Data.Digits
import Data.List

main :: IO ()
main = do file <- readFile "./p079_keylog.txt"
          let ints = map read $ lines file :: [Int]
          print $ p079 ints

p079 :: Integral a => [a] -> a
p079 ints = let intLists = nub . sort $ map (digits 10) ints
                secNums = filter exists [0..9]
                  where exists n = any (n `elem`) intLists
            in unDigits 10 $ nextUntil ((secNums, []), intLists)

next :: Integral a => (([a], [a]), [[a]]) -> (([a], [a]), [[a]])
next ((xs, ys), zss) = ((xs', ys ++ [x]), map (filter (/=x)) zss )
  where x = head $ filter (check zss) xs
        xs' = filter (/=x) xs

nextUntil :: Integral a => (([a], [a]), [[a]]) -> [a]
nextUntil (([], ys), _) = ys
nextUntil t             = nextUntil $ next t

onlyHead :: Eq a => a -> [a] -> Bool
onlyHead x = (||) <$> null <*> notElem x . tail

check :: Integral a => [[a]] -> a -> Bool
check zss n = all (onlyHead n) zss
