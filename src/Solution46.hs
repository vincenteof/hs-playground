module Solution46 (permute) where

-- https://leetcode.cn/problems/permutations/

permute :: [Int] -> [[Int]]
permute [] = []
permute [x] = [[x]]
permute xs = [x : ys | x <- xs, ys <- permute $ filter (/= x) xs]
