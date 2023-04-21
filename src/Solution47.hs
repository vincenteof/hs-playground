module Solution47 (permuteUnique) where
import qualified Data.Set as Set
import Data.List (sort,nub)

-- https://leetcode.cn/problems/permutations-ii/

-- permuteUnique :: [Int] -> [[Int]]
-- permuteUnique = permuteUniqueSorted . sort

-- permuteUniqueSorted :: [Int] -> [[Int]]
-- permuteUniqueSorted original = go original Set.empty 
--     where 
--         go :: [Int] -> Set.Set Int -> [[Int]]
--         go [] _ = [[]]
--         go (x:xs) visited 
--             | Set.member x visited = go xs visited
--             | otherwise = 
--                 let ys = permuteUniqueSorted $ removeOne x original
--                 in map (++ [x]) ys
        
removeOne :: Int -> [Int] -> [Int]
removeOne _ [] = []
removeOne x (y : ys) = if x == y then ys else y : removeOne x ys

permuteUnique :: [Int] -> [[Int]]
permuteUnique [] = [[]]
permuteUnique xs = [x : ys | x <- nub xs, ys <- permuteUnique $ removeOne x xs]

-- 1,1,2


-- some related topics:
-- https://www.fpcomplete.com/haskell/library/containers/
