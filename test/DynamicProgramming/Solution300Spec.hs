module DynamicProgramming.Solution300Spec where

import DynamicProgramming.Solution300 (lengthOfLIS)
import Test.Hspec

spec :: Spec
spec = do
  describe "lengthOfLIS" $ do
    it "handles base case" $ lengthOfLIS [10, 9, 2, 5, 3, 7, 101, 18] `shouldBe` 4
    it "handles base case" $ lengthOfLIS [0, 1, 0, 3, 2, 3] `shouldBe` 4
    it "handles the case with same-element array" $ lengthOfLIS [7, 7, 7, 7, 7, 7, 7] `shouldBe` 1