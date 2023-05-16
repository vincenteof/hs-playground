module Solution79Spec where

import Solution79 (exist)
import Test.Hspec

spec :: Spec
spec = do
  describe "exist" $ do
    it "handles base case" $ exist [] "" `shouldBe` True
    it "handles exist case1" $ exist [['A', 'B', 'C', 'E'], ['S', 'F', 'C', 'S'], ['A', 'D', 'E', 'E']] "ABCCED" `shouldBe` True
    it "handles exist case2" $ exist [['A', 'B', 'C', 'E'], ['S', 'F', 'C', 'S'], ['A', 'D', 'E', 'E']] "SEE" `shouldBe` True
    it "handles basic non-exist case" $ exist [] "nonexist" `shouldBe` False
    it "handles complex non-exist case" $ exist [['A', 'B', 'C', 'E'], ['S', 'F', 'C', 'S'], ['A', 'D', 'E', 'E']] "ABCB" `shouldBe` False
