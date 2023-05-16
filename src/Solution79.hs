module Solution79 (exist) where

-- https://leetcode.cn/problems/word-search/

type Pos = (Int, Int)

type Board = [[Bool]]

get :: Pos -> [[a]] -> a
get (i, j) board = board !! i !! j

emptyBoard :: Int -> Int -> Board
emptyBoard n m = replicate n (replicate m False)

visitCell :: Board -> (Int, Int) -> Board
visitCell board (i, j) =
  let (first, second) = splitAt i board
      newRow = replace j True (head second)
   in first ++ [newRow] ++ tail second

replace :: Int -> a -> [a] -> [a]
replace i x xs = take i xs ++ [x] ++ drop (i + 1) xs

choice :: Pos -> Int -> Int -> [Pos]
choice (i, j) m n = filter inRange [(i + 1, j), (i - 1, j), (i, j + 1), (i, j - 1)]
  where
    inRange (i1, j1) = i1 >= 0 && i1 < m && j1 >= 0 && j1 < n

exist :: [[Char]] -> String -> Bool
exist _ "" = True
exist [] _ = False
exist board target = or [go (i, j) target (emptyBoard m n) | i <- [0 .. m-1], j <- [0, n-1]]
  where
    m = length board
    n = length $ head board
    go :: Pos -> String -> Board -> Bool
    go _ "" _ = True
    go pos (cur : rest) visited
      | get pos board /= cur = False
      | get pos visited = False
      | otherwise = or [go newPos rest (visitCell visited pos) | newPos <- choice pos m n]
