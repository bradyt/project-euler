-- Counting Sundays
-- Problem 19

-- You are given the following information, but you may prefer to do
-- some research for yourself.

--  +  1 Jan 1900 was a Monday.
--  +  Thirty days has September,
--     April, June and November.
--     All the rest have thirty-one,
--     Saving February alone,
--     Which has twenty-eight, rain or shine.
--     And on leap years, twenty-nine.
--  +  A leap year occurs on any year evenly divisible by 4, but not
--     on a century unless it is divisible by 400.

-- How many Sundays fell on the first of the month during the
-- twentieth century (1 Jan 1901 to 31 Dec 2000)?

import Data.List (foldl')

type DayW = Int
type DayM = Int
type Month = Int
type Year = Int
type Date = (DayM, Month, Year)

isLeap :: Year -> Bool
isLeap y = if y `mod` 100 == 0
           then y `mod` 400 == 0
           else y `mod` 4 == 0

nextDate :: (DayM, Month, Year) -> (DayM, Month, Year)
nextDate (d, m, y)
  | d <= 27 = (d + 1, m, y)
nextDate (28, 2, y) = if isLeap y
                      then (29, 2, y)
                      else nextMonth (28, 2, y)
nextDate (29, 2, y) = nextMonth (29, 2, y)
nextDate (31, m, y) = nextMonth (31, m, y)
nextDate (30, m, y)
  | m `elem` [4,6,9,11] = nextMonth (30, m, y)
nextDate (d, m, y) = (d + 1, m, y)

nextMonth :: (DayM, Month, Year) -> (DayM, Month, Year)
nextMonth (_, 12, y) = (1, 1, y + 1)
nextMonth (_, m, y) = (1, m + 1, y)

compareDates :: (DayM, Month, Year) -> (DayM, Month, Year) -> Ordering
compareDates (d, m, y) (d', m', y') = compare (y, m, d) (y', m', d')

nextDay :: DayW -> DayW
nextDay n = (n + 1) `mod` 7

nextDayAndDate :: (DayW, (DayM, Month, Year)) -> (DayW, (DayM, Month, Year))
nextDayAndDate (day, date) = (nextDay day, nextDate date)

day_1_1_1901 :: DayW
day_1_1_1901 = go (1,(1,1,1900))
  where go dayAndDate@(n, (_, _, y))
          | y == 1901 = n
          | otherwise = go $ nextDayAndDate dayAndDate

countSundays :: Year -> Int
countSundays year = go 0 (day_1_1_1901, (1,1,1901))
  where go k dayAndDate@(n, (d, m, y))
          | y == year && m == 12 && d == 31 = k
          | d == 1 && n == 0 = go (k+1) $ nextDayAndDate dayAndDate
          | otherwise        = go k     $ nextDayAndDate dayAndDate

main = print $ countSundays 2000
