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

main :: IO ()
main = do file <- readFile "./p079_keylog.txt"
          let ints = map read $ lines file :: [Int]
          print ints

ints = [319,680,180,690,129,620,762,689,762,318,368,710,720,710,629,168,160,689,716,731,736,729,316,729,729,710,769,290,719,680,318,389,162,289,162,718,729,319,790,680,890,362,319,760,316,729,380,319,728,716]

strings = ["319","680","180","690","129","620","762","689","762","318","368","710","720","710","629","168","160","689","716","731","736","729","316","729","729","710","769","290","719","680","318","389","162","289","162","718","729","319","790","680","890","362","319","760","316","729","380","319","728","716"]

string = "319680180690129620762689762318368710720710629168160689716731736729316729729710769290719680318389162289162718729319790680890362319760316729380319728716"

-- 73162890

-- did by hand

-- 6 < 2

-- 7 < 3

-- 3 < 1

