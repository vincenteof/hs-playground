module Solution39 (combinationSum) where
import Control.Monad (guard)
import Data.List (sort)

-- https://leetcode.cn/problems/combination-sum/

-- divider and conquer with dp
-- or
-- backtracking

combinationSum :: [Int] -> Int -> [[Int]]
combinationSum candidates = go (sort candidates)
    where
        go :: [Int] -> Int -> [[Int]]
        go _ 0 = [[]]
        go [] _ = []
        go candidates' target = do
            c <- candidates'
            guard (c <= target)
            solution <- go (filter (>= c) candidates') (target - c)
            return (c:solution)


-- [2,3,6,7] 7
-- 2 combinationSum [2,3,6,7] 5 -> [[2,2,3]]
    -- 2 combinationSum [2,3,6,7] 3 -> [[2,3]]
        -- 2 combinationSum [2,3,6,7] 1
        -- 3 combinationSum [3,6,7] 0 [3]
            -- []
    -- 3 combinationSum [3,6,7] 2
-- 3 combinationSum [3,6,7] 4
    -- 3 combinationSum [3,6,7] 1
-- 6 combinationSum [6,7] 1
-- 7 combinationSum [7] 0 -> [7]
    -- []

-- [2,3,5] 8
-- [5,3] [3,3,2] [2,2,2,2]

-- [2] 1