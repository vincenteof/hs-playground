module Solution215 (findKthLargest) where

-- https://leetcode.cn/problems/kth-largest-element-in-an-array/

findKthLargest :: Int -> [Int] -> Int
findKthLargest = helper

helper :: Int -> [Int] -> Int
helper _ [] = error "params error"
helper 1 xs = maximum xs
helper k (x : xs)
  | rightLength == k - 1 = x
  | rightLength < k - 1 = helper (k - rightLength - 1) left
  | otherwise = helper k right
  where
    left = filter (<= x) xs
    right = filter (> x) xs
    rightLength = length right

-- 3,2,1,5,6,4
-- k=2
-- p 3
-- 2,1
-- 5,6,4

-- 2,1
-- k=2
-- p 2
-- 1
-- []

-- 3,2,3,1,2,4,5,5,6
-- k=4
-- p 3
-- 2,3,1,2
-- 4,5,5,6

-- 2,3,1,2
-- k=4
-- p 2
-- 1,2
-- 3

-- 3
-- k=1