module DynamicProgramming.Solution70Spec where
import DynamicProgramming.Solution70 (climbStairs)    
import Test.Hspec

spec :: Spec
spec = do
  describe "climbStairs" $ do
    it "handles base case 1" $ climbStairs 1 `shouldBe` 1
    it "handles base case 2" $ climbStairs 2 `shouldBe` 2
    it "handles recursive case of 3" $ climbStairs 3 `shouldBe` 3
