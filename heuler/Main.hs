{-# LANGUAGE OverloadedStrings #-}
module Main where

import System.Environment (getArgs)
import P001 hiding (main)
import P002 hiding (main)
import P003 hiding (main)
import P004 hiding (main)
import P005 hiding (main)
import P006 hiding (main)
import P007 hiding (main)
import P008 hiding (main)
import P009 hiding (main)
import P010 hiding (main)
import P011 hiding (main)
import P012 hiding (main)
import P013 hiding (main)
import P014 hiding (main)
import P015 hiding (main)
import P016 hiding (main)
import P017 hiding (main)
import P018 hiding (main)
import P019 hiding (main)
import P020 hiding (main)
import P021 hiding (main)
import P022 hiding (main)
import P023 hiding (main)
import P024 hiding (main)
import P025 hiding (main)
import P026 hiding (main)
import P027 hiding (main)
import P028 hiding (main)
import P029 hiding (main)
import P030 hiding (main)
import P031 hiding (main)
import P032 hiding (main)
import P033 hiding (main)
import P034 hiding (main)
import P035 hiding (main)
import P036 hiding (main)
import P037 hiding (main)
import P038 hiding (main)
import P039 hiding (main)
import P040 hiding (main)
import P041 hiding (main)
import P042 hiding (main)
import P043 hiding (main)
import P044 hiding (main)
import P045 hiding (main)
import P046 hiding (main)
import P047 hiding (main)
import P048 hiding (main)
import P049 hiding (main)
import P050 hiding (main)
import P051 hiding (main)
import P052 hiding (main)
import P053 hiding (main)
import P054 hiding (main)
import P055 hiding (main)
import P056 hiding (main)
import P057 hiding (main)
import P058 hiding (main)
import P059 hiding (main)
import P062 hiding (main)
import P063 hiding (main)
import P067 hiding (main)
import P069 hiding (main)
import P071 hiding (main)
import P076 hiding (main)
import P079 hiding (main)
import P092 hiding (main)
import P097 hiding (main)
import P099 hiding (main)
import P206 hiding (main)
 
import qualified Formatting as F
import Formatting.Clock
import System.Clock
import Text.Read (readMaybe)

-- https://github.com/mstksg/advent-of-code-2017/blob/master/aoc2017.cabal
-- https://github.com/pechersky/hs-otw/blob/master/src/Natas/TH.hs
-- https://github.com/pechersky/hs-otw/blob/master/src/Natas.hs

thunk :: Int -> IO ()
thunk n = do
    putStr ("p" ++ show n ++ "\t")
    start <- getTime Monotonic
    x <- lookupSolution n
    end <- x `seq` getTime Monotonic
    F.fprint (timeSpecs F.% "\t") start end
    putStrLn x

main :: IO ()
main = do
    args <- getArgs
    let all = [1..59] ++ [ 62, 63, 67, 69, 71
                         , 76, 92, 97, 99, 206 ]
        ps = case args of
            []        -> all
            (arg0:[]) -> case (readMaybe arg0 :: Maybe Int) of
                 Just n  -> [n]
                 Nothing -> all
    mapM_ thunk ps


lookupSolution :: Int -> IO String
lookupSolution n = case lookup n problemMap of
    Nothing -> pure "no item in map"
    Just x  -> x
 
problemMap :: [(Int, IO String)]
problemMap =
    [ (1, pure $ show p001)
    , (2, pure $ show p002)
    , (3, pure $ show p003)
    , (4, pure $ show p004)
    , (5, pure $ show p005)
    , (6, pure $ show p006)
    , (7, pure $ show p007)
    , (8, pure $ show p008)
    , (9, pure $ show p009)
    , (10, pure $ show p010)
    , (11, pure $ show p011)
    , (12, pure $ show p012)
    , (13, pure $ show p013)
    , (14, pure $ show p014)
    , (15, pure $ show p015)
    , (16, pure $ show p016)
    , (17, pure $ show p017)
    , (18, pure $ show p018)
    , (19, pure $ show p019)
    , (20, pure $ show p020)
    , (21, pure $ show p021)
    , (22, fmap   show p022)
    , (23, pure $ show p023)
    , (24, pure $ show p024)
    , (25, pure $ show p025)
    , (26, pure $ show p026)
    , (27, pure $ show p027)
    , (28, pure $ show p028)
    , (29, pure $ show p029)
    , (30, pure $ show p030)
    , (31, pure $ show p031)
    , (32, pure $ show p032)
    , (33, pure $ show p033)
    , (34, pure $ show p034)
    , (35, pure $ show p035)
    , (36, pure $ show p036)
    , (37, pure $ show p037)
    , (38, pure $ show p038)
    , (39, pure $ show p039)
    , (40, pure $ show p040)
    , (41, pure $ show p041)
    , (42, fmap   show p042)
    , (43, pure $ show p043)
    , (44, pure $ show p044)
    , (45, pure $ show p045)
    , (46, pure $ show p046)
    , (47, pure $ show p047)
    , (48, pure $ show p048)
    , (49, pure $ show p049)
    , (50, pure $ show p050)
    , (51, pure        p051)
    , (52, pure $ show p052)
    , (53, pure $ show p053)
    , (54, fmap   show p054)
    , (55, pure $ show p055)
    , (56, pure $ show p056)
    , (57, pure $ show p057)
    , (58, pure $ show p058)
    , (59, fmap   show p059)
    , (62, pure $ show p062)
    , (63, pure $ show p063)
    , (67, fmap   show p067)
    , (69, pure $ show p069)
    , (71, pure $ show p071)
    , (76, pure $ show p076)
    -- , (79, show p079)
    , (92, pure $ show p092)
    , (97, pure $ show p097)
    , (99, fmap   show p099)
    , (206, pure $ show p206)
    ]
