module Solution784Spec where

import Solution784 (letterCasePermutation)
import Test.Hspec

spec :: Spec
spec = do
  describe "letterCasePermutation" $ do
    it "handles base case" $ letterCasePermutation [] `shouldBe` [[]]
    it "handles single lower case letter" $ letterCasePermutation "a" `shouldBe` ["a", "A"]
    it "handles single upper case letter" $ letterCasePermutation "A" `shouldBe` ["a", "A"]
    it "handles single digit" $ letterCasePermutation "1" `shouldBe` ["1"]
    it "handles two lower case letters" $ letterCasePermutation "ab" `shouldBe` ["ab", "aB", "Ab", "AB"]
    it "handles two digits" $ letterCasePermutation "12" `shouldBe` ["12"]
    it "base mixed case" $ letterCasePermutation "3z4" `shouldBe` ["3z4", "3Z4"]
    it "complex mixed case" $ letterCasePermutation "a1b2" `shouldBe` ["a1b2", "a1B2", "A1b2", "A1B2"]
