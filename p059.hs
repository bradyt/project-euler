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

import Text.CSV
import Data.Char
import Data.List
import Data.Bits
import Control.Applicative

type ASCII = Int
type Triple = Int
type Key = Int

main :: IO ()
main = do
  Right file <- parseCSVFromFile "./p059_cipher.txt"
  let ints = map read $ head file :: [Int]
  print $ take 50 $ concatBits ints

concatBits :: [ASCII] -> [Triple]
concatBits []         = []
concatBits [x]        = shift x 14 : []
concatBits [x, y]     = shift x 14 + shift y 7 : []
concatBits (x:y:z:zs) = shift x 14 + shift y 7 + z : concatBits zs

splitBit :: Triple -> [ASCII]
splitBit triple = [ shift triple (-14)
                  , shift triple (-7) .&. 127
                  , triple .&. 127 ]

ints :: [Triple]
ints = [ 1301900, 42915, 134676, 33220, 132292, 737292, 156100
       , 66437, 380289, 354261, 1288149, 1168138, 1166732, 42886
       , 33805, 147597, 148548, 312193, 1170443, 345540, 98710
       , 34560, 501633, 508695, 312576, 1206188, 42899, 101956
       , 262928, 255907, 132552, 1165066, 59276, 42899, 101956
       , 524288 ,1206230, 1168257, 1166341, 337805, 157584, 247108
       , 83203, 229514, 229507, 1166349, 312260, 524288, 1206231
       , 1168257 ]

keys = [0..2^21-1]

applyKey :: Triple -> [Triple] -> [Triple]
applyKey key ints = map (xor key) ints

bitAndAtI :: Triple -> ASCII -> Int -> Bool
bitAndAtI triple n i = shift triple (7*i) .&. n /= 0

checkTriplePrintable :: Triple -> Bool
checkTriplePrintable triple = any (bitAndAtI triple 96) [0..2]

isCharE :: ASCII -> Bool
isCharE int = int `elem` map ord ['E', 'e']

countEChars :: Triple -> Int
countEChars triple = let asciis = splitBit triple in
  length $ filter isCharE asciis

-- getKeys :: [Key]
