module DynamicProgramming.Solution322 (coinChange) where

-- https://leetcode.cn/problems/coin-change/

coinChange :: [Int] -> Int -> Int
coinChange coins amount = calcMemo !! amount
  where
    smallest = minimum coins
    calcMemo = map calc [0 ..]
    calc :: Int -> Int
    calc 0 = 0
    calc target
      | target < smallest = -1
      | otherwise =
        let possibleCalculations = filter (>= 0) [calcMemo !! (target - c) | c <- coins, c <= target]
         in if null possibleCalculations then -1 else minimum possibleCalculations + 1