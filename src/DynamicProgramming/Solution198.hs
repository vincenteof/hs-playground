module DynamicProgramming.Solution198 (rob, robOpt) where

-- https://leetcode.cn/problems/house-robber/

rob :: [Int] -> Int
rob [] = 0
rob xs = robMemo !! (len - 1)
  where
    len = length xs
    robMemo :: [Int]
    robMemo = map rob' [0 ..]
    rob' :: Int -> Int
    rob' 0 = head xs
    rob' 1 = max (head xs) (xs !! 1)
    rob' k =
      let choiceA = (xs !! k) + robMemo !! (k - 2)
          choiceB = robMemo !! (k - 1)
       in max choiceA choiceB

-- this version is less efficient because of `!!`
-- we are trying to avoid that

robOpt :: [Int] -> Int
robOpt [] = 0
robOpt [x] = x
robOpt xs = last robMemo
  where
    res0 = head xs
    res1 = max (head xs) (xs !! 1)
    robMemo = res0 : res1 : zipWith3 robK (tail $ tail xs) robMemo (tail robMemo)
    robK k resA resB = max (k + resA) resB

-- [1,2,3]
-- zipWith3 robK [3] [1,2,*] [2,*]
-- robK 3 1 2