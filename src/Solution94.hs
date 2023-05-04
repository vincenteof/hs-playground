module Solution94 (inorderTraversal) where

import Tree (Tree (..))

-- https://leetcode.cn/problems/binary-tree-inorder-traversal/
-- haskell has many optimization for recursion,
-- so there is no need to use stack to simulate recursion.

inorderTraversal :: Tree Int -> [Int]
inorderTraversal Empty = []
inorderTraversal (Node value left right) = inorderTraversal left ++ [value] ++ inorderTraversal right
