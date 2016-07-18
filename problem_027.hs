
import Math.NumberTheory.Primes

quadForm :: Num a => a -> a -> a -> a
quadForm a b = \n -> n^2 + a*n + b

countPrimes :: Integer -> Integer -> Int
countPrimes a b = length $ takeWhile isPrime $ map (quadForm a b) [0..]

asAndBs :: [(Integer, Integer)]
asAndBs = [ (a, b) | a <- [-999..999], b <- [-999..999] ]

find :: (Integer, Int)
find = foldr updateMax (0, 0) asAndBs
  
updateMax :: (Integer, Integer) -> (Integer, Int) -> (Integer, Int)
updateMax (a, b) (p, m) = let nextCount = countPrimes a b
                                 in if nextCount > m
                                    then (a * b, nextCount)
                                    else (p,     m)

problem27 :: Integer
problem27 = fst find
