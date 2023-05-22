module Solution70Spec where
import DynamicProgramming.Solution70 (climbStairs)    
import Test.Hspec

spec :: Spec
spec = do
  describe "climbStairs" $ do
    it "handles base case 1" $ climbStairs 1 `shouldBe` 1