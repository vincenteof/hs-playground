module Solution121 (maxProfit) where

-- https://leetcode.cn/problems/best-time-to-buy-and-sell-stock

maxPriceBound :: Int
maxPriceBound = 10 * 10 * 10 * 10 + 1

maxProfit :: [Int] -> Int
maxProfit prices = maxProfitHelper prices maxPriceBound minBound

maxProfitHelper :: [Int] -> Int -> Int -> Int
maxProfitHelper [] _ res = res
maxProfitHelper (p : ps) buyPrice res =
  maxProfitHelper ps newBuyPrice newRes
  where
    newBuyPrice = min buyPrice p
    newRes = max res (p - newBuyPrice)
