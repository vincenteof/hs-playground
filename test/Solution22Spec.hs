module Solution22Spec where

import Data.List (sort)
import Solution22 (generateParenthesis, generateParenthesis', generateParenthesis'')
import Test.Hspec

shouldBeAfterSort :: (Show a, Ord a) => [a] -> [a] -> Expectation
shouldBeAfterSort x y = sort x `shouldBe` sort y

spec :: Spec
spec = do
  describe "generateParenthesis" $ do
    it "handles case for n equals 1" $ generateParenthesis 1 `shouldBeAfterSort` ["()"]
    it "handles case for n equals 2" $ generateParenthesis 2 `shouldBeAfterSort` ["(())", "()()"]
    it "handles case for n equals 3" $ generateParenthesis 3 `shouldBeAfterSort` ["((()))", "(()())", "(())()", "()(())", "()()()"]
    it "handles case for n equals 1" $ generateParenthesis' 1 `shouldBeAfterSort` ["()"]
    it "handles case for n equals 2" $ generateParenthesis' 2 `shouldBeAfterSort` ["(())", "()()"]
    it "handles case for n equals 3" $ generateParenthesis' 3 `shouldBeAfterSort` ["((()))", "(()())", "(())()", "()(())", "()()()"] 
    it "handles case for n equals 1" $ generateParenthesis'' 1 `shouldBeAfterSort` ["()"]
    it "handles case for n equals 2" $ generateParenthesis'' 2 `shouldBeAfterSort` ["(())", "()()"]
    it "handles case for n equals 3" $ generateParenthesis'' 3 `shouldBeAfterSort` ["((()))", "(()())", "(())()", "()(())", "()()()"] 