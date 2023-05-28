module DynamicProgramming.Solution279 (numSquares) where

-- https://leetcode.cn/problems/perfect-squares/

squareRoot :: Int -> Int
-- todo: remove the warning 
-- done: hel from chatgpt, because `sqrt` is part of both the `Floating` and `RealFrac` typeclasses
squareRoot k = floor (sqrt (fromIntegral k :: Double))

numSquares :: Int -> Int
numSquares n = numSquaresMemo !! n
  where
    -- todo: opt change to `Array` or `Vector`
    numSquaresMemo :: [Int]
    numSquaresMemo = map numSquares' [0 ..]
    numSquares' :: Int -> Int
    numSquares' 0 = 0
    numSquares' k = 1 + minimum [numSquaresMemo !! (k - x * x) | x <- [1 .. squareRoot k]]

-- to calculate f[k], we need to first pick a perfect square number
-- we have squareRoot k choices
-- by doing that we reduce the problem size
-- and previous calculation is also cache-able