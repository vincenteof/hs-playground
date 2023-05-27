module DynamicProgramming.Solution198Spec where

import DynamicProgramming.Solution198 (rob, robOpt)
import Test.Hspec

spec :: Spec
spec = do
  describe "generate" $ do
    it "handles empty input" $ rob [] `shouldBe` 0
    it "handles single element" $ rob [1] `shouldBe` 1
    it "handles two elements" $ rob [1, 2]`shouldBe` 2
    it "handles recursive case 1" $ rob [1,2,3,1] `shouldBe` 4
    it "handles recursive case 2" $ rob [2,7,9,3,1] `shouldBe` 12
    it "handles empty input for opt version" $ robOpt [] `shouldBe` 0
    it "handles single element for opt version" $ robOpt [1] `shouldBe` 1
    it "handles two elements for opt version" $ robOpt [1, 2]`shouldBe` 2
    it "handles recursive case 1 for opt version" $ robOpt [1,2,3,1] `shouldBe` 4
    it "handles recursive case 2 for opt version" $ robOpt [2,7,9,3,1] `shouldBe` 12
