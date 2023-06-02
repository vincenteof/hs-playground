module DynamicProgramming.Solution139 (wordBreak) where
import Data.List (isPrefixOf)

-- https://leetcode.cn/problems/word-break/

wordBreak :: String -> [String] -> Bool
wordBreak target wordDict = calc target
  where
    calc :: String -> Bool
    calc "" = True
    calc remaining = or [calc $ removePrefix w target | w <- wordDict, w `isPrefixOf` remaining]
    removePrefix :: String -> String -> String
    removePrefix prefix str = drop (length prefix) str