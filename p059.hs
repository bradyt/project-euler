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

fiftyInts :: [Int]
fiftyInts = [79,59,12,2,79,35,8,28,20,2,3,68,8,9,68,45,0,12,9,67,68,4
            ,7,5,23,27,1,21,79,85,78,79,85,71,38,10,71,27,12,2,79,6,2
            ,8,13,9,1,13,9,8]

-- 103, 42, 33

main :: IO ()
main = do
  Right file <- parseCSVFromFile "./p059_cipher.txt"
  let ints = map read $ head file :: [Int]
      key = getKey ints
  print key

applyKey :: [Int] -> [Int] -> [Int]
applyKey encrypted key =
  zipWith xor encrypted $ concat $ repeat key

getKey :: [Int] -> [Int]
getKey encrypted = map (getIthKey encrypted) [0,1,2]

getIthKey :: [Int] -> Int -> Int
getIthKey xs i =
  let ys = everyThirdFromN i xs
      mostCommon = snd $ maximum $ itemsToFreqTuple ys
  in xor mostCommon $ ord 'e'

everyThirdFromN :: Int -> [Int] -> [Int]
everyThirdFromN n xs = let ys = drop n xs in go ys
  where go [] = []
        go [x] = [x]
        go [x, y] = [x]
        go [x, y, z] = [x]
        go (x:y:z:zs) = x : go zs

itemsToFreqTuple :: [Int] -> [(Int, Int)]
itemsToFreqTuple = map tuple . group . sort
  where tuple ys = (length ys, head ys)

-- a = [98,99,100,101,102,114,120]
-- b = [106,107,108,109,110,112,122]
-- c = [96,102,103,123]

-- consider a list, constrain on keys so that we get printable
-- characters, then for viable candidate, check that 'e' (101) is common. 

checkKey :: [Int] -> Int -> Maybe String
checkKey column key =
  let result = map (xor key) column
  in if all (`elem` [32..126]) result
     then Just $ map chr result
     else Nothing
  
