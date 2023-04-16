module Solution121Spec where

import Solution121 (maxProfit)
import Test.Hspec

spec :: Spec
spec = do
  describe "maxProfit" $ do
    it "handles positive profit case" $ maxProfit [7, 1, 5, 3, 6, 4] `shouldBe` 5
    it "handles zero profit case" $ maxProfit [7, 6, 4, 3, 1] `shouldBe` 0