module Solution17 (letterCombinations) where

-- https://leetcode.cn/problems/letter-combinations-of-a-phone-number/

letterCombinations :: String -> [String]
letterCombinations [] = []
letterCombinations xs = go xs
  where
    go [] = [""]
    go (y : ys) = do
      letter <- lettersForNumber y
      subCombinations <- go ys
      return (letter : subCombinations)

lettersForNumber :: Char -> [Char]
lettersForNumber '2' = "abc"
lettersForNumber '3' = "def"
lettersForNumber '4' = "ghi"
lettersForNumber '5' = "jkl"
lettersForNumber '6' = "mno"
lettersForNumber '7' = "pqrs"
lettersForNumber '8' = "tuv"
lettersForNumber '9' = "wxyz"
lettersForNumber _ = []
