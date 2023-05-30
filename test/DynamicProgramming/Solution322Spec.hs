module DynamicProgramming.Solution322Spec where

import DynamicProgramming.Solution322 (coinChange)
import Test.Hspec

spec :: Spec
spec = do
  describe "numSquares" $ do
    it "handles input 1" $ coinChange [1, 2, 5] 11 `shouldBe` 3
    it "handles input 2" $ coinChange [2] 3 `shouldBe` -1
    it "handles base case" $ coinChange [1, 2, 3] 0 `shouldBe` 0
