module Solution22 (generateParenthesis, generateParenthesis', generateParenthesis'') where

import Control.Monad (guard)
import Data.List (nub)

-- https://leetcode.cn/problems/generate-parentheses/

-- at end of backtracking we will find one solution
-- we combine them together
generateParenthesis :: Int -> [String]
generateParenthesis n = backtrack n n ""
  where
    backtrack :: Int -> Int -> String -> [String]
    backtrack left right current
      | left == 0 && right == 0 = [current]
      | left == 0 = backtrack left (right - 1) (current ++ ")")
      | left == right = backtrack (left - 1) right (current ++ "(")
      | otherwise = backtrack left (right - 1) (current ++ ")") ++ backtrack (left - 1) right (current ++ "(")

-- it's basically the same as first one
-- but using list monad
generateParenthesis' :: Int -> [String]
generateParenthesis' n = backtrack n n ""
  where
    backtrack :: Int -> Int -> String -> [String]
    backtrack 0 0 current = [current]
    backtrack left right current = do
      guard (left <= right)
      case (left, right) of
        (0, _) -> backtrack left (right - 1) (current ++ ")")
        _
          | left == right -> backtrack (left - 1) right (current ++ "(")
          | otherwise -> backtrack left (right - 1) (current ++ ")") ++ backtrack (left - 1) right (current ++ "(")

-- this solution is based on divide and conquer
-- f(n) = f(n - 1) composing with "()"
generateParenthesis'' :: Int -> [String]
generateParenthesis'' 0 = [""]
generateParenthesis'' 1 = ["()"]
generateParenthesis'' n = [item | sub <- generateParenthesis'' (n - 1), item <- extend sub]

extend :: String -> [String]
extend s = nub ["(" ++ s ++ ")", s ++ "()", "()" ++ s]

-- n = 1
-- ()

-- n = 2
-- (()) ()()

-- n = 3
-- ((())) (()()) ()(()) (())() ()()()
