module Solution131Spec where

import Solution131 (partition)
import Test.Hspec

spec :: Spec
spec = do
  describe "partition" $ do
    it "handles empty string" $ partition "" `shouldBe` [[]]
    it "handles single element string" $ partition "a" `shouldBe` [["a"]]
    it "handles basic case" $ partition "aab" `shouldBe` [["a", "a", "b"], ["aa", "b"]]