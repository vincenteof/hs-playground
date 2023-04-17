import Test.Hspec
import qualified Solution4Spec
import qualified Solution121Spec
import qualified Solution215Spec


main :: IO ()
main = hspec $ do
  describe "solution4" Solution4Spec.spec
  describe "solution121" Solution121Spec.spec
  describe "solution215" Solution215Spec.spec

