module Solution39Spec where

import Data.List (sort)
import Solution39 (combinationSum)
import Test.Hspec

shouldBeAfterSort :: (Show a, Ord a) => [a] -> [a] -> Expectation
shouldBeAfterSort x y = sort x `shouldBe` sort y

spec :: Spec
spec = do
  describe "combinationSum" $ do
    it "handles base case for success" $ combinationSum [2, 3] 0 `shouldBeAfterSort` [[]]
    it "handles base case for failure" $ combinationSum [] 2 `shouldBeAfterSort` []
    it "handles basic case 1" $ combinationSum [2, 3, 5] 8 `shouldBeAfterSort` [[2, 2, 2, 2], [2, 3, 3], [3, 5]]
    it "handles basic case 2" $ combinationSum [2, 3, 6, 7] 7 `shouldBeAfterSort` [[2, 2, 3], [7]]
    it "handles no-solution case" $ combinationSum [2] 1 `shouldBeAfterSort` []