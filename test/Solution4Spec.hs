module Solution4Spec where

import Solution4 (findMedianSortedArrays)
import Test.Hspec

spec :: Spec
spec = do
  describe "findMedianSortedArrays" $ do
    it "handles odd case" $ findMedianSortedArrays [1, 3] [2] `shouldBe` 2
    it "handles even case" $ findMedianSortedArrays [1, 2] [3, 4] `shouldBe` 2.5
    it "handles more complex case" $ findMedianSortedArrays [1, 3, 5, 6, 8] [2, 7, 9] `shouldBe` 5.5
