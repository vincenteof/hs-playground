module Solution17Spec where

import Solution17 (letterCombinations)
import Test.Hspec

spec :: Spec
spec = do
  describe "letterCombinations" $ do
    it "handles empty input" $ letterCombinations "" `shouldBe` []
    it "handles basic case" $ letterCombinations "2" `shouldBe` ["a", "b", "c"]
    it "handles basic recursion case" $ letterCombinations "23" `shouldBe` ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]