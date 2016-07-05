import Data.List

lexPerms [x] = [[x]]
lexPerms xs = concatMap (\x -> map (x:) lexPerms delete x xs) xs

solution = (lexPerms [0..9]) !! 999999
