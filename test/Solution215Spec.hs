module Solution215Spec where

import Solution215 (findKthLargest)
import Test.Hspec

spec :: Spec
spec = do
  describe "findKthLargest" $ do
    it "handles base case" $ findKthLargest 2 [3,2,1,5,6,4] `shouldBe` 5
    it "handles base case" $ findKthLargest 4 [3,2,3,1,2,4,5,5,6] `shouldBe` 4
    it "handles maximum case" $ findKthLargest 1 [3,2,3,1,2,4,5,5,6] `shouldBe` 6
    it "handles minimum case" $ findKthLargest 9 [3,2,3,1,2,4,5,5,6] `shouldBe` 1