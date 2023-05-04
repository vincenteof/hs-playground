module Solution94Spec where

import Solution94 (inorderTraversal)
import Test.Hspec
import Tree (Tree (..))

spec :: Spec
spec = do
  describe "inorderTraversal" $ do
    it "handles empty tree" $ inorderTraversal Empty `shouldBe` []
    it "handles single element tree" $ inorderTraversal (Node 1 Empty Empty) `shouldBe` [1]
    it "handles multi elements tree" $ inorderTraversal (Node 1 Empty (Node 2 (Node 3 Empty Empty) Empty)) `shouldBe` [1, 3, 2]