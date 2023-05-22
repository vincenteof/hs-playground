module DynamicProgramming.Solution70 (climbStairs) where

-- https://leetcode.cn/problems/climbing-stairs/    

climbStairs :: Int  -> Int 
climbStairs  n = climbStairsMemo !! n
    where 
        climbStairsMemo = map climbStairs' [0..]
        climbStairs' :: Int -> Int
        climbStairs' 0 = 0
        climbStairs' 1 = 1
        climbStairs' 2 = 2
        climbStairs' i = climbStairs' (i - 1) + climbStairs' (i - 2)