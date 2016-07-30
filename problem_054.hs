-- Poker hands
-- Problem 54

-- In the card game poker, a hand consists of five cards and are
-- ranked, from lowest to highest, in the following way:

--     High Card: Highest value card.
--     One Pair: Two cards of the same value.
--     Two Pairs: Two different pairs.
--     Three of a Kind: Three cards of the same value.
--     Straight: All cards are consecutive values.
--     Flush: All cards of the same suit.
--     Full House: Three of a kind and a pair.
--     Four of a Kind: Four cards of the same value.
--     Straight Flush: All cards are consecutive values of same suit.
--     Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.

-- The cards are valued in the order:
-- 2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.

-- If two players have the same ranked hands then the rank made up of
-- the highest value wins; for example, a pair of eights beats a pair
-- of fives (see example 1 below). But if two ranks tie, for example,
-- both players have a pair of queens, then highest cards in each hand
-- are compared (see example 4 below); if the highest cards tie then
-- the next highest cards are compared, and so on.

-- Consider the following five hands dealt to two players:

-- Hand   Player 1            Player 2              Winner
-- 1      5H 5C 6S 7S KD      2C 3S 8S 8D TD        Player 2
--        Pair of Fives       Pair of Eights
-- 2      5D 8C 9S JS AC      2C 5C 7D 8S QH        Player 1
--        Highest card Ace    Highest card Queen
-- 3      2D 9C AS AH AC      3D 6D 7D TD QD        Player 2
--        Three Aces          Flush with Diamonds
-- 4      4D 6S 9H QH QC      3D 6D 7H QD QS        Player 1
--        Pair of Queens      Pair of Queens
--        Highest card Nine   Highest card Seven
-- 5      2H 2D 4C 4D 4S      3C 3D 3S 9S 9D        Player 1
--        Full House          Full House
--        With Three Fours    with Three Threes

-- The file, poker.txt, contains one-thousand random hands dealt to
-- two players. Each line of the file contains ten cards (separated by
-- a single space): the first five are Player 1's cards and the last
-- five are Player 2's cards. You can assume that all hands are valid
-- (no invalid characters or repeated cards), each player's hand is in
-- no specific order, and in each hand there is a clear winner.

-- How many hands does Player 1 win?

import Data.List (sort, sortBy, group)
import qualified Data.Map as M
import Data.Map (Map)

type Mult = Int
type Val = Int
type RankAndVals = (Rank, [Val])

data Rank = HighCard | OnePair | TwoPairs | ThreeOfAKind | Straight
  | Flush | FullHouse | FourOfAKind | StraightFlush | RoyalFlush
  deriving (Ord, Eq, Show)

numMap :: Map Char Int
numMap = M.fromList $ zip (['2'..'9'] ++ "TJQKA") [2..]

-- |"5H 5C 6S 7S KD 2C 3S 8S 8D TD" -> (["5H","5C","6S","7S","KD"], ["2C", "3S", "8S", "8D", "TD"])
roundToHands :: [Char] -> ([[Char]], [[Char]])
roundToHands = splitAt 5 . words

-- |["5H","5C","6S","7S","KD"] -> ([(2,5),(1,13),(1,7),(1,6)],False)
tuplesAndFlush :: [[Char]] -> ([(Mult, Val)], Bool)
tuplesAndFlush h =
  let tupled            = map (\[x,y] -> (x,y)) h
      (numChars, suits) = unzip tupled
      flushBool         = all (== head suits) $ tail suits
      mult xs           = (length xs, head xs)
      cardMultAndInt    = map mult $ group $ sort $ map (numMap M.!) numChars
      cardMultAndInt'   = reverse $ sortBy cardSort cardMultAndInt
  in (cardMultAndInt', flushBool)
  where cardSort (m, c) (m', c') =
          if m == m'
          then compare c c'
          else compare m m'

-- |([(2,5),(1,13),(1,7),(1,6)],False) -> (OnePair,[5,13,7,6])
rankAndVals :: ([(Mult, Val)], Bool) -> (Rank, [Val])
rankAndVals h = (rank h, map snd $ fst h)

rank :: ([(Mult, Val)], Bool) -> Rank
rank (multValTuples, flush) =
  let (mults, vals) = unzip multValTuples
      straight = maximum vals - minimum vals == 4
  in
    case ((mults!!0, mults!!1)) of
      (4, _) -> FourOfAKind
      (3, 2) -> FullHouse
      (3, _) -> ThreeOfAKind
      (2, 2) -> TwoPairs
      (2, _) -> OnePair
      (_, _) ->
        case (straight, flush) of
          (True,  True)  -> if head vals == 14
                            then RoyalFlush
                            else StraightFlush
          (True,  False) -> Straight
          (False, True)  -> Flush
          (False, False) -> HighCard

roundToRankAndVals :: [Char] -> (RankAndVals, RankAndVals)
roundToRankAndVals = tupleMap (rankAndVals . tuplesAndFlush) . roundToHands
  where tupleMap f (x, y) = (f x, f y)

compareRankAndVals :: (RankAndVals, RankAndVals) -> Ordering
compareRankAndVals ((rank, vals), (rank', vals')) =
  case (compare rank rank') of
    GT -> GT
    LT -> LT
    EQ -> compare vals vals'

compareHands :: [Char] -> Ordering
compareHands = compareRankAndVals . roundToRankAndVals

scoreRounds :: [[Char]] -> Int
scoreRounds = length . filter (==GT) . map compareHands

main :: IO ()
main = do file <- readFile "./p054_poker.txt"
          let rounds = lines file
              score = scoreRounds rounds
          print score
