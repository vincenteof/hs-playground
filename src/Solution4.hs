module Solution4 (findMedianSortedArrays) where

import Data.List (sort)
import Data.Maybe (fromMaybe)

-- https://leetcode.cn/problems/median-of-two-sorted-arrays

findMedianSortedArrays :: [Int] -> [Int] -> Double
findMedianSortedArrays outerXs outerYs = helper outerXs outerYs outerK
  where
    lenX = length outerXs
    lenY = length outerYs
    lenTotal = lenX + lenY
    isEven = even lenTotal
    outerK = if isEven then lenTotal `div` 2 else lenTotal `div` 2 + 1
    helper :: [Int] -> [Int] -> Int -> Double
    helper [] [] _ = error "params error"
    helper xs ys 1 =
      if isEven
        -- using `/` instead `div` for floating number calculation
        then fromIntegral (target0 + target1) / 2.0
        else fromIntegral target0
      where
        x0 = fromMaybe maxBound (safeIndex 0 xs)
        x1 = fromMaybe maxBound (safeIndex 1 xs)
        y0 = fromMaybe maxBound (safeIndex 0 ys)
        y1 = fromMaybe maxBound (safeIndex 1 ys)
        (target0, target1) = pickTwoLeast x0 x1 y0 y1
    helper xs ys k =
      if elemX < elemY
        then helper newXs ys (k - halfK)
        else helper xs newYs (k - halfK)
      where
        halfK = k `div` 2
        pos = halfK - 1
        elemX = fromMaybe maxBound (safeIndex pos xs)
        elemY = fromMaybe maxBound (safeIndex pos ys)
        (_, newXs) = splitAt halfK xs
        (_, newYs) = splitAt halfK ys

pickTwoLeast :: Ord a => a -> a -> a -> a -> (a, a)
pickTwoLeast a b c d = (head sortedList, sortedList !! 1)
  where
    sortedList = sort [a, b, c, d]

safeIndex :: Int -> [a] -> Maybe a
safeIndex i xs
  | i < 0 || i >= length xs = Nothing
  | otherwise = Just (xs !! i)

-- k is (m + n) / 2 and (m + n) / 2 + 1 for even
-- k is (m + n) / 2 + 1 for odd
-- we compare element at pos 
--    k `div` 2 - 1
-- for xs and ys
-- using the result, we can reduce k and half of xs or ys

-- case1
-- 1,3,5,6,8
-- 2,7,9
-- k=4

-- 5,6,8
-- 2,7,9
-- k=2

-- 5,6,8
-- 7,9
-- k=1

-- case2
-- 1,2
-- 3,4
-- k=2

-- 2
-- 3,4
-- k=1