module Solution47 (permuteUnique, permuteUnique') where
import Data.List (nub, sort)

permuteUnique :: [Int] -> [[Int]]
permuteUnique = go . sort
  where
    go :: [Int] -> [[Int]]
    go [] = [[]]
    go xs = do
      x <- uniques xs
      let remaining = go $ removeOne x xs
      map (x :) remaining

uniques :: [Int] -> [Int]
uniques [] = []
uniques [x] = [x]
uniques (x : xs) = go x xs [x]
  where
    go :: Int -> [Int] -> [Int] -> [Int]
    go _ [] acc = reverse acc
    go prev (y : ys) acc
      | prev == y = go prev ys acc
      | otherwise = go y ys (y : acc)      

removeOne :: Eq a => a -> [a] -> [a]
removeOne _ [] = []
removeOne x (y : ys)
  | x == y = ys
  | otherwise = y : removeOne x ys


-- `nub` is inefficient and we will use it many times make the problem even worse.
-- suppose the list is sorted, find unique elements will be able in linear time complexity.
permuteUnique' :: [Int] -> [[Int]]
permuteUnique' [] = [[]]
permuteUnique' xs = [x : ys | x <- nub xs, ys <- permuteUnique' $ removeOne x xs]



-- case 1,1,2
-- xs 1,1,2

-- some related topics:
-- https://www.fpcomplete.com/haskell/library/containers/
