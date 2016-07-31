
nextDate :: (Int, Int, Int) -> (Int, Int, Int)
nextDate (d, m, y)
  | d == 28 && m == 2  = if isLeap y
                         then (d + 1, m, y)
                         else nextMonth (d, m, y)
  | d == 29 && m == 2  = nextMonth (d, m, y)
  | d == 30 && m `elem` [4,6,9,11] = nextMonth (d, m, y)
  | d <= 30            = (d + 1, m, y)
  | d == 31            = nextMonth (d, m, y)
  | otherwise          = error "not defined"

nextMonth :: (Int, Int, Int) -> (Int, Int, Int)
nextMonth (_, m, y)
  | m == 12   = (1, 1, y + 1)
  | otherwise = (1, m + 1, y)

isLeap :: Int -> Bool
isLeap y = if y `mod` 100 == 0
           then if y `div` 400 == 0
                then True
                else False
           else if y `mod` 4 == 0
                then True
                else False

nextDayAndDate :: (Int, (Int, Int, Int)) -> (Int, (Int, Int, Int))
nextDayAndDate (n, date)
  | n == 6    = (0, nextDate date)
  | otherwise = (n+1, nextDate date)

day_1_1_1901 :: Int
day_1_1_1901 = go (1,(1,1,1900))
  where go dayAndDate@(n, (_, _, y))
          | y == 1901 = n
          | otherwise = go $ nextDayAndDate dayAndDate

countSundays :: Int -> Int
countSundays year = go 0 (day_1_1_1901, (1,1,1901))
  where go k dayAndDate@(n, (d, m, y))
          | y == year && m == 12 && d == 31 = k
          | d == 1 && n == 0 = go (k+1) $ nextDayAndDate dayAndDate
          | otherwise        = go k     $ nextDayAndDate dayAndDate
