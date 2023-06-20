module DynamicProgramming.Solution118Spec where
import DynamicProgramming.Solution118 (generate)
import Test.Hspec

spec :: Spec
spec = do
  describe "generate" $ do
    it "handles case for 1" $ generate 1 `shouldBe` [[1]]
    it "handles case for 2" $ generate 2 `shouldBe` [[1], [1, 1]]
    it "handles case for 3" $ generate 3 `shouldBe` [[1], [1, 1], [1, 2, 1]]
    it "handles case for 4" $ generate 4 `shouldBe` [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]]
    it "handles case for 5" $ generate 5 `shouldBe` [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]
