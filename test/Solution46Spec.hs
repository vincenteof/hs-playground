module Solution46Spec where

import Solution46 (permute)
import Test.Hspec

spec :: Spec
spec = do
  describe "permute" $ do
    it "handles empty list" $ permute [] `shouldBe` [[]]
    it "handles single element list" $ permute [1] `shouldBe` [[1]]
    it "handles two-element list" $ permute [0, 1] `shouldBe` [[0, 1], [1, 0]]
    it "handles multi-elements list" $ permute [1, 2, 3] `shouldBe` [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
