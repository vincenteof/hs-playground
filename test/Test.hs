module Main where

import qualified Solution121
import qualified Solution4
import qualified System.Exit as Exit
import Test.HUnit

test1 :: Test
test1 = TestCase (assertEqual "basic case" 5 (Solution121.maxProfit [7, 1, 5, 3, 6, 4]))

test2 :: Test
test2 = TestCase (assertEqual "no transaction" 0 (Solution121.maxProfit [7, 6, 4, 3, 1]))

test3 :: Test
test3 = TestCase (assertEqual "base case 1" 2 (Solution4.findMedianSortedArrays [1, 3] [2]))

test4 :: Test
test4 = TestCase (assertEqual "base case 2" 2.5 (Solution4.findMedianSortedArrays [1, 2] [3, 4]))

tests :: Test
tests = TestList [TestLabel "test1" test1, TestLabel "test2" test2, TestLabel "test3" test3, TestLabel "test4" test4]

main :: IO ()
main = do
  result <- runTestTT tests
  if failures result > 0 then Exit.exitFailure else Exit.exitSuccess