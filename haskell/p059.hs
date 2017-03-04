-- XOR decryption
-- Problem 59
--
-- Each character on a computer is assigned a unique code and the
-- preferred standard is ASCII (American Standard Code for Information
-- Interchange). For example, uppercase A = 65, asterisk (*) = 42, and
-- lowercase k = 107.
--
-- A modern encryption method is to take a text file, convert the
-- bytes to ASCII, then XOR each byte with a given value, taken from a
-- secret key. The advantage with the XOR function is that using the
-- same encryption key on the cipher text, restores the plain text;
-- for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.
--
-- For unbreakable encryption, the key is the same length as the plain
-- text message, and the key is made up of random bytes. The user
-- would keep the encrypted message and the encryption key in
-- different locations, and without both "halves", it is impossible to
-- decrypt the message.
--
-- Unfortunately, this method is impractical for most users, so the
-- modified method is to use a password as a key. If the password is
-- shorter than the message, which is likely, the key is repeated
-- cyclically throughout the message. The balance for this method is
-- using a sufficiently long password key for security, but short
-- enough to be memorable.
--
-- Your task has been made easy, as the encryption key consists of
-- three lower case characters. Using cipher.txt (right click and
-- 'Save Link/Target As...'), a file containing the encrypted ASCII
-- codes, and the knowledge that the plain text must contain common
-- English words, decrypt the message and find the sum of the ASCII
-- values in the original text.

import Text.CSV (parseCSVFromFile)
import Data.Char (chr, isPrint)
import Data.Bits (xor, shift, (.&.))
import Data.Ratio ((%), Ratio)
import Data.Maybe (Maybe)

type ASCII = Int
type Triple = Int
type Key = Int

key = 1701860

main :: IO ()
main = do
  Right file <- parseCSVFromFile "./p059_cipher.txt"
  let asciis = map read $ head file :: [Int]
  print $ sum $ applyKey asciis key
  -- mapM_ print $
  --   filter isJust $
  --   map (maybeStringAndKey asciis) keys

maybeStringAndKey :: [ASCII] -> Key -> Maybe ([ASCII], Key)
maybeStringAndKey asciis key =
  let candidate = applyKey asciis key
  in if asciiViable candidate
     then Just (candidate, key)
     else Nothing

keyAndTest :: [ASCII] -> Key -> ([ASCII] -> Bool) -> Bool
keyAndTest asciis key test = test $ applyKey asciis key

splitKey :: Key -> [ASCII]
splitKey key = [ shift key (-14)
               , shift key (-7) .&. 127
               , key .&. 127 ]

keys :: [Key]
keys = [0..2^21-1]

applyKey :: [ASCII] -> Key -> [ASCII] 
applyKey asciis = zipWith xor asciis . concat . repeat . splitKey

isCharE :: ASCII -> Bool
isCharE = (`elem` ['E', 'e']) . chr

countEChars :: [ASCII] -> Int
countEChars = length . filter isCharE

ratioEs :: [ASCII] -> Ratio Int
ratioEs asciis = (countEChars asciis) % (length asciis)

asciiViable :: [ASCII] -> Bool
asciiViable asciis = all (isPrint . chr) asciis &&
  ratioEs asciis > 0.1

-- ints :: [Triple]
-- ints = [1301900,42915,134676,33220,132292,737292,156100,66437
--        ,380289,354261,1288149,1168138,1166732,42886,33805,147597
--        ,148548,312193,1170443,345540,98710,34560,501633,508695
--        ,312576,1206188,42899,101956,262928,255907,132552,1165066
--        ,59276,42899,101956,524288,1206230,1168257,1166341,337805
--        ,157584,247108,83203,229514,229507,1166349,312260,524288
--        ,1206231,1168257,1164822,34576,34244,35969,346896,246538
--        ,10128,247062,42893,336068,671760,246538,10113,508695
--        ,314948,312197,321420,42880,230794,1052100,165647,41156
--        ,1370024,230529,1164048,328968,26515,101956,229572,246537
--        ,1238917,148932,312205,337800,230529,1164301,279831,1163661
--        ,912,1166731,1164562,36509,131201,1206225,1170828,42888
--        ,230412,321431,246538,36420,312214,134403,255888,247108
--        ,50966,196737,331336,1165066,59280,247108,50966,196737
--        ,331332,67338,1163393,279830,1164572,312074,3341,328644
--        ,232906,1174724,524288,1166849,150980,737292,157584,247108
--        ,608020,312087,321491,1166731,1166721,180676,35969,346891
--        ,148804,99979,298436,312193,1163661,912,1166859,1166732
--        ,101828,35969,346891,148804,164611,249284,83208,230674
--        ,42886,34309,298497,1163266,1164173,337808,36368,229643
--        ,150346,1174468,737292,157580,229655,33154,1166341,337802
--        ,134596,312193,1163661,912,1517452,42899,101956,131208
--        ,501637,1166349,311425,331332,311364,312193,1163661,912
--        ,1206237,1170828,42891,148804,263051,1164055,1166732,42896
--        ,347393,1163661,912,1238931,245828,786,36420,180995,249284
--        ,311364,35969,346891,148808,1166341,337795,131850,10128
--        ,141191,131329,1164042,311364,312193,1166347,344448,1206229
--        ,1435558,298436,98704,245777,964,312193,1166347,344448,1166341
--        ,337801,99713,1166732,344081,964,246537,1238928,247108,262166
--        ,181700,49920,156688,1166977,65539,148254,42892,229700,263041
--        ,157580,42887,98561,1206229,1419169,279818,1164042,1164173
--        ,337803,262340,182026,59269,148932,98571,148548,246551,1163283
--        ,157588,32788,181576,1164161,1166341,337802,134596,99847,36752
--        ,34250,1175382,1169041,321424,141189,180676,263051,1164929
--        ,180993,279808,1164173,173957,148932,99847,36752,34244,246537
--        ,1238924,42883,101505,1166732,42902,230412,321424,141190,34315
--        ,165188,66445,181654,32964,132292,524288,1206229,1386416
--        ,247069,1165078,42902,34443,344261,1170828,233028,233028
--        ,147472,1165124,377757,328455,98756,82710,312260,345367
--        ,295312,229507,1164438,131396,249097,98500,378647,328459
--        ,157579,354196,182026,1238928,246551,1166977,82710,312260
--        ,65545,36420,20107,173987,132554,1420740,852036,312193
--        ,1170443,345540,83207,98561,1164177,165642,1165066,59272
--        ,232577,59276,36481,1163274,1164549,347532,1165065,131203
--        ,1166615,1206188,42899,101956,19720,190347,26513,148613
--        ,229773,148548,180242,42885,148932,18189,312194,295306
--        ,36375,1206181,148932,263492,247570,42903,34058,1164173
--        ,337795,180246,500164,312193,1164296,134813,1163266,1166732
--        ,42891,147869,1170955,157579,26512,247108,542480,247062,1196032]

-- ints = [ 1301900, 42915, 134676, 33220, 132292, 737292, 156100
--        , 66437, 380289, 354261, 1288149, 1168138, 1166732, 42886
--        , 33805, 147597, 148548, 312193, 1170443, 345540, 98710
--        , 34560, 501633, 508695, 312576, 1206188, 42899, 101956
--        , 262928, 255907, 132552, 1165066, 59276, 42899, 101956
--        , 524288 ,1206230, 1168257, 1166341, 337805, 157584, 247108
--        , 83203, 229514, 229507, 1166349, 312260, 524288, 1206231
--        , 1168257 ]

-- undefined
