module P092 (main92) where

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

-- How many starting numbers below tzen million will arrive at 89?

-- import qualified Data.Map as M
-- import Data.Map (Map)
import qualified Data.IntMap as IM
import Data.IntMap (IntMap)
import Data.Digits
import Control.Monad.State
import qualified Data.Vector as V
import Data.List (unfoldr)
import Data.Sequence (unfoldl)

prop :: Int -> Int
prop n = sum $ map (^2) $ digits 10 n

-- mStart = M.fromList [ (1, False), (89, True) ]
iMStart = IM.fromList [(1, False), (89, True)]

-- problem92 = M.foldWithKey foldingFunction 0 finalMap

-- finalMap :: M.Map Int Bool
-- finalMap = checkEach (mStart, [1..10^7-1])

-- checkEach :: (M.Map Int Bool, [Int]) -> M.Map Int Bool
-- checkEach (intMap, []) = intMap
-- checkEach (intMap, x:xs) = checkEach (intMap', xs)
--   where intMap' =
--           case (M.lookup x intMap) of
--             Just bool -> intMap
--             Nothing -> M.insert x (goesTo89 x) intMap

-- addAsYouGo x intMap =
--   if M.member x intMap then intMap
--   else case (M.lookup next intMap) of
--     Just bool -> M.insert undefined undefined undefined
--   where next = prop x

-- M.foldWithKey :: (k -> a -> b -> b) -> b -> M.Map k a -> b
foldingFunction n bool s = if bool then s + 1 else s

-- goesTo89 :: Int -> Bool
-- goesTo89 n = isTrueInMap n $ M.fromList [ (1, False), (89, True) ]

-- isTrueInMap :: Int -> M.Map Int Bool -> Bool
-- isTrueInMap n intMap =
--   case (M.lookup n intMap) of
--     Just bool -> bool
--     Nothing -> isTrueInMap (prop n) intMap

-- checkInt :: Int -> I.IntMap Bool -> 
-- checkInt n intMap = if I.member n intMap then
--   case (I.lookup n intMap) of
--     Just bool -> bool
--     Nothing ->
--       if checkInt (propInt n) intMap
--       then I.insert n True intMap
--       else undefined

-- 1 -> (1,False)
-- 2 -> 4 -> 37 -> 58 -> 89

-- every number will map to True or False
-- [(1, False), (89, True)]
-- place result of 2 at 2.
-- get result of 2
-- is result of 4
-- is result of 37
-- is result of 58
-- is result of 89 is True


-- is result should also do work to update that value
-- so,
-- [(1, False), (58, True), (89, True)]
-- [(1, False), (37, True), (58, True), (89, True)]

-- data End = One | EightyNine | TBD

-- or, can retain chain, and add them all at once, so
-- [2, 4, 37, 58, 89]          -> True
-- [3, 9, 81, 65, 61, 37]      -> True
-- [5, 25, 29, 85, 89]         -> True
-- [6, 36, 45, 41, 17, 50, 25] -> True
-- [7, 49, 97, 130, 10]        -> False
-- [8, 64, 52, 29]             -> True
-- [11, 2, 4]                  -> True
-- [12, 5]                     -> True
-- [13, 10]                    -> False

accrueUntil :: Int -> ([Int], Maybe Bool)
accrueUntil x = go [x]
  where go (x:xs) =
          case y of
            89        -> (xs, Just True)
            -- 58         -> (xs, Just False)
            1         -> (xs, Just False)
            otherwise -> go (y:x:xs)
        y = prop x

-- makeChain :: Map Int Bool -> Int -> [Int]
-- makeChain map b = unfoldr go b
--   where go b' = 
--           case (M.lookup b' map) of
--             Nothing    -> Just (b', prop b')
--             Just True  -> Nothing
--             Just False -> Nothing

-- makeChainAndBool :: Map Int Bool -> Int -> [(Int, Bool)]
-- makeChainAndBool map x =
--   let xs        = makeChain map x
--       Just bool = M.lookup (prop $ last xs) map
--   in zip xs $ repeat bool

-- M.fromList :: [(Int, Bool)] -> Map Int Bool
-- M.union :: Map Int Bool -> Map Int Bool -> Map Int Bool

-- fold the map over the list, [1..10^6]

-- the folding function will take map as init, and for each element of

-- makeArray = foldr go mStart [1..10^p-1]
--   where go :: Int -> Map Int Bool -> Map Int Bool
--         go x map =
--           case (M.lookup x map) of
--             Just _  -> map
--             Nothing -> M.union map map'
--               where xs = makeChainAndBool map x
--                     map' = M.fromList xs

filterFalseAndTooLarge :: Int -> Bool -> Bool
filterFalseAndTooLarge n bool = bool -- && n < 10^n

p = 6

-- main92 = print $ M.size $ M.filterWithKey filterFalseAndTooLarge makeArray

checkIth :: Int -> IntMap Bool -> IntMap Bool
checkIth n map
  | n > 2           = map
  | IM.member n map = checkIth (n+1) map
  | otherwise       =
      let (bool, map') = updateIth n map
      in checkIth (n+1) map'

updateIth :: Int -> IntMap Bool -> (Bool, IntMap Bool)
updateIth n map =
  case (IM.lookup n map) of
    Just bool  -> (bool, map)
    Nothing    -> updateIth undefined undefined

-- i need a function that updates the map _and_ returns the result

main92 = print $ IM.size $ IM.filter id $ check 1 iMStart

check :: Int -> IntMap Bool -> IntMap Bool
check 100000 map = map
check n map =
  case (IM.lookup n map) of
    Just _  -> check (n+1) map
    Nothing -> check (n+1) map'
      where map'  = IM.union map map''
            map'' = IM.fromList $ chain n map

-- chain :: Int -> IntMap Bool -> [(Int, Bool)]
-- chain n map = zip xs $ repeat bool
--   where (xs, bool) = makeChain n map
  
makeChain'' :: Int -> IntMap Bool -> ([Int], Bool)
makeChain'' b map = go [b]
  where go (x:xs) =
          case (IM.lookup x map) of
            Nothing   -> go $ prop x : x : xs
            Just bool -> (xs, bool)

makeChain' :: Int -> IntMap Bool -> [Int]
makeChain' b map = unfoldr go b
  where go b' = 
          case (IM.lookup b' map) of
            Nothing    -> Just (b', prop b')
            Just True  -> Nothing
            Just False -> Nothing

chain :: Int -> IntMap Bool -> [(Int, Bool)]
chain x map =
  let (xs, bool) = makeChain'' x map
  in zip xs $ repeat bool
