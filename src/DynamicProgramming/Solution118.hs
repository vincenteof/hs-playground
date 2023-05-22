module DynamicProgramming.Solution118 (generate) where

-- https://leetcode.cn/problems/pascals-triangle/

generate :: Int -> [[Int]]
generate num = [[calcMemo !! m !! n | n <- [1 .. m]] | m <- [1 .. num]]
  where
    calcMemo = [[calc m n | n <- [0 .. m]] | m <- [0 .. num]]
    calc :: Int -> Int -> Int
    calc 0 _ = 0
    calc _ 0 = 0
    calc _ 1 = 1
    calc m n
      | n > m = 0
      | n == m = 1
      | otherwise = calcMemo !! (m - 1) !! (n - 1) + calcMemo !! (m - 1) !! n
