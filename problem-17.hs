translate :: Int -> [Char]
translate 1000 = "onethousand"
translate 1 = "one"
translate 2 = "two"
translate 3 = "three"
translate 4 = "four"
translate 5 = "five"
translate 6 = "six"
translate 7 = "seven"
translate 8 = "eight"
translate 9 = "nine"
translate 10 = "ten"
translate 11 = "eleven"
translate 12 = "twelve"
translate 13 = "thirteen"
translate 14 = "fourteen"
translate 15 = "fifteen"
translate 18 = "eighteen"
translate 20 = "twenty"
translate 30 = "thirty"
translate 40 = "forty"
translate 50 = "fifty"
translate 80 = "eighty"
translate n
  | r == 0   = translate q ++ "hundred"
  | n > 100  = translate (100*q) ++ "and" ++ translate r
  where (q, r) = divMod n 100
translate n
  | n `elem` [14..19] = translate (n-10) ++ "teen"
translate n
  | r == 0            = translate q ++ "ty"
  | q `elem` [2..9]  = translate (10*q) ++ translate r
  where (q, r) = divMod n 10
translate _ = error "not defined"

problem17 :: Int
problem17 = sum $ map (length . translate) [1..1000]
