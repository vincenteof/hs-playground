module Solution784 (letterCasePermutation, transformLetter) where

import Data.Char (isLetter, toLower, toUpper)

-- https://leetcode.cn/problems/letter-case-permutation/

letterCasePermutation :: String -> [String]
letterCasePermutation [] = [[]]
letterCasePermutation (x : xs) = do
  transformed <- transformLetter x
  let subResult = letterCasePermutation xs
  map (transformed :) subResult

-- It's different from 46 or 47
-- these problems will pick one element from the whole list in some position
-- while here we only need to transform the letter in some position
-- and it has nothing to do with other elements

transformLetter :: Char -> [Char]
transformLetter x
  | isLetter x = [toLower x, toUpper x]
  | otherwise = [x]