module Solution47Spec where

import Solution47 (permuteUnique)
import Test.Hspec

spec :: Spec
spec = do
  describe "permute" $ do
    it "handles empty list" $ permuteUnique [] `shouldBe` [[]]
    it "handles single element list" $ permuteUnique [1] `shouldBe` [[1]]
    it "handles two-element list" $ permuteUnique [0, 1] `shouldBe` [[0, 1], [1, 0]]
    it "handles multi-elements list" $ permuteUnique [1, 2, 3] `shouldBe` [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]
    it "handles list with duplicates" $ permuteUnique [1, 1, 2] `shouldBe` [[1, 1, 2], [1, 2, 1], [2, 1, 1]]
