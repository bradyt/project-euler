
import Data.Char (chr)





sayMe :: (Integral a) => a -> String  
sayMe 1 = "One!"  
sayMe 2 = "Two!"  
sayMe 3 = "Three!"  
sayMe 4 = "Four!"  
sayMe 5 = "Five!"  
sayMe x = "Not between 1 and 5"  

myHead (x:xs) = x








factorial :: Integral a => a -> a
factorial n = product [1..n]

pNToIP :: (Integral a) => a -> a -> (a, a)
pNToIP p n =
  divMod p (factorial (n-1))

nextIndex p n = (i, p', n-1)
  where (i, p') = pNToIP p n

nextIndexRec p 0 = [] -- ???
nextIndexRec p n = i : nextIndexRec p' n'
  where (i, p', n') = nextIndex p n

indicesToElems is = go is ([0..(length is)-1])
  where go []       _   = []
        go (i':is') xs' = e : go is' xs''
          where (e, xs'') = iLToEL i' xs'

iLToEL i xs = (e, xs')
  where (e, xs') = takeIth i xs

takeIth n xs = (z, ys ++ zs)
  where (ys, (z:zs)) = splitAt (fromIntegral n) xs

lexi p n = indicesToElems $ nextIndexRec p n

convertIntsToStr = map intToChar

intToChar = chr . (+48)
