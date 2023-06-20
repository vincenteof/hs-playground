module DynamicProgramming.Solution300 (lengthOfLIS) where
import Data.Array

-- https://leetcode.cn/problems/longest-increasing-subsequence

lengthOfLIS :: [Int] -> Int
lengthOfLIS xs = cache ! (len - 1)
  where
    len = length xs
    arr = listArray (0, len - 1) xs
    cache :: Array Int Int
    cache = listArray (0, len - 1) [calc i | i <- [0 .. len - 1]]
    calc :: Int -> Int
    calc 0 = 1
    calc i =
      let targets = [cache ! j | j <- [0 .. i - 1], arr ! j < arr ! i]
       in if null targets
            then 1
            else maximum targets + 1
            
-- [10,9,2,5,3,7,101,18]
-- [1,1,1,2,2,3,4,4]