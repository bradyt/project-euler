-- Square digit chains
-- Problem 92

-- A number chain is created by continuously adding the square of the
-- digits in a number to form a new number until it has been seen
-- before.

-- For example,

-- 44 → 32 → 13 → 10 → 1 → 1
-- 85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89

-- Therefore any chain that arrives at 1 or 89 will become stuck in an
-- endless loop. What is most amazing is that EVERY starting number
-- will eventually arrive at 1 or 89.

-- How many starting numbers below ten million will arrive at 89?

import qualified Data.Map as M
import Data.Digits
import Control.Monad.State

-- state s will be the list
-- so s -> (a, s) in general will update state and output a value a
-- the value can simply be Bool, so a will be True/False
-- (IntMap Bool) -> (a, IntMap Bool),
-- which is State (IntMap Bool) a



start = M.fromList [ (1, False), (89, True) ]

problem92 = M.foldWithKey foldingFunction 0 finalMap

finalMap :: M.Map Integer Bool
finalMap = checkEach (start, [1..10^7-1])

checkEach :: (M.Map Integer Bool, [Integer]) -> M.Map Integer Bool
checkEach (intMap, []) = intMap
checkEach (intMap, x:xs) = checkEach (intMap', xs)
  where intMap' =
          case (M.lookup x intMap) of
            Just bool -> intMap
            Nothing -> M.insert x (goesTo89 x) intMap

addAsYouGo x intMap =
  if M.member x intMap then intMap
  else case (M.lookup next intMap) of
    Just bool -> M.insert undefined undefined undefined
  where next = propogateInt x

-- M.foldWithKey :: (k -> a -> b -> b) -> b -> M.Map k a -> b
foldingFunction n bool s = if bool then s + 1 else s

goesTo89 :: Integer -> Bool
goesTo89 n = isTrueInMap n $ M.fromList [ (1, False), (89, True) ]

isTrueInMap :: Integer -> M.Map Integer Bool -> Bool
isTrueInMap n intMap =
  case (M.lookup n intMap) of
    Just bool -> bool
    Nothing -> isTrueInMap (propogateInt n) intMap

-- checkInt :: Int -> I.IntMap Bool -> 
-- checkInt n intMap = if I.member n intMap then
--   case (I.lookup n intMap) of
--     Just bool -> bool
--     Nothing ->
--       if checkInt (propogateInt n) intMap
--       then I.insert n True intMap
--       else undefined

propogateInt :: Integer -> Integer
propogateInt n = sum $ map (^2) $ digits 10 n

-- 1 -> (1,False)
-- 2 -> 4 -> 37 -> 58 -> 89
