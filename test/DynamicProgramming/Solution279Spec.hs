module DynamicProgramming.Solution279Spec where

import DynamicProgramming.Solution279 (numSquares)
import Test.Hspec

spec :: Spec
spec = do
  describe "numSquares" $ do
    it "handles input 1" $ numSquares 1 `shouldBe` 1
    it "handles input 2" $ numSquares 2 `shouldBe` 2
    it "handles input 3" $ numSquares 3 `shouldBe` 3
    it "handles input 4" $ numSquares 4 `shouldBe` 1
    it "handles input 5" $ numSquares 5 `shouldBe` 2
    it "handles input 6" $ numSquares 6 `shouldBe` 3
    it "handles input 7" $ numSquares 7 `shouldBe` 4
    it "handles input 8" $ numSquares 8 `shouldBe` 2
    it "handles input 9" $ numSquares 9 `shouldBe` 1
    it "handles input 10" $ numSquares 10 `shouldBe` 2
    it "handles input 11" $ numSquares 11 `shouldBe` 3
    it "handles input 12" $ numSquares 12 `shouldBe` 3
    it "handles input 13" $ numSquares 13 `shouldBe` 2







