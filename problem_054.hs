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

import Data.List (sort, groupBy, subsequences, permutations)
-- import Data.Digits
import Data.Char (digitToInt)

testHands = 
  [ "5H 5C 6S 7S KD 2C 3S 8S 8D TD"
  , "5D 8C 9S JS AC 2C 5C 7D 8S QH"
  , "2D 9C AS AH AC 3D 6D 7D TD QD"
  , "4D 6S 9H QH QC 3D 6D 7H QD QS"
  , "2H 2D 4C 4D 4S 3C 3D 3S 9S 9D" ]

type Hand = [(Char, Char)]

data HandRank = HighCard | OnePair | TwoPairs | ThreeOfAKind | Straight
  | Flush | FulHouse | FourOfAKind | StraightFlush | RoyalFlush
  deriving (Enum, Ord, Eq, Show)

convertHandToNumbers :: Hand -> [Int]
convertHandToNumbers h = map go h
  where go (nc, s)
          | nc `elem` ['1'..'9'] = digitToInt nc
          | nc == 'T'            = 10
          | nc == 'J'            = 11
          | nc == 'Q'            = 12
          | nc == 'K'            = 13


testRound = words $ testHands !! 0

testHand = take 5 testRound

tupleCard :: String -> (Char, Char)
tupleCard [x, y] = (x, y)

tupledTestHand = map tupleCard testHand

isFlush :: Hand -> Bool
isFlush (x:xs) = all (== snd x) $ map snd xs

determineRank :: Hand -> HandRank
determineRank h =
  let straight = isStraight h
      flush = isFlush h in
  if straight && flush then
    if any (\c -> snd c == 'A') h
    then RoyalFlush
    else StraightFlush
  else
    let subHands = groupByNumber h
        sizes = groupSizes subHands
        cases
          | 4 `elem` sizes            = FourOfAKind
          | all (`elem` sizes) [3, 2] = ThreeOfAKind
          | flush                     = Flush
          | straight                  = Straight
          | 3 `elem` sizes            = ThreeOfAKind
          | 2 `elem` sizes            = OnePair
          | otherwise                 = HighCard
    in cases

canonical = concatMap permutations $ go 0 
  ['2','3','4','5','6','7','8','9','T','J','Q','K','A']
  where go 9 xs = []
        go n  xs = take 5 xs : go (n+1) (tail xs)

isStraight :: Hand -> Bool
isStraight h = let numbers = map fst h in
  numbers `elem` canonical

groupByNumber :: Hand -> [Hand]
groupByNumber = groupBy (\x y -> fst x == fst y)

groupSizes :: [Hand] -> [Int]
groupSizes = map length

isFourOfAKind :: [Int] -> Bool
isFourOfAKind = (4 `elem`)

-- royal flush
-- straight flush

-- 4, 1           fourOfAKind
-- 3, 2           fullHouse

-- straight
-- flush

-- 3, 1, 1        threeOfAKind
-- 2, 2, 1        twoPairs
-- 2, 1, 1, 1     onePair
-- 1, 1, 1, 1, 1  HighCard


