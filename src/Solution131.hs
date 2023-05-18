module Solution131 (partition) where

import Control.Monad (guard)

-- https://leetcode.cn/problems/palindrome-partitioning/

-- todo: memorize it
isPalindrome :: String -> Int -> Int -> Bool
isPalindrome "" _ _ = True
isPalindrome str start end
  | start >= end - 1 = True
  | str !! start == str !! (end - 1) = isPalindrome str (start + 1) (end - 1)
  | otherwise = False

slice :: Int -> Int -> [a] -> [a]
slice start end xs = take (end - start) (drop start xs)

partition :: String -> [[String]]
partition str = go 0 []
  where
    len = length str
    getNextPos :: Int -> [Int]
    getNextPos start = do
      end <- [start + 1 .. len]
      guard $ isPalindrome str start end
      return end
    go :: Int -> [String] -> [[String]]
    go start result
      | start == len = [reverse result]
      | otherwise = concat [go nextStart (slice start nextStart str : result) | nextStart <- getNextPos start]