import Test.Hspec
import qualified Solution4Spec
import qualified Solution17Spec
import qualified Solution46Spec
import qualified Solution47Spec
import qualified Solution121Spec
import qualified Solution215Spec
import qualified Solution784Spec



main :: IO ()
main = hspec $ do
  describe "solution4" Solution4Spec.spec
  describe "solution17" Solution17Spec.spec
  describe "solution46" Solution46Spec.spec
  describe "solution47" Solution47Spec.spec
  describe "solution121" Solution121Spec.spec
  describe "solution215" Solution215Spec.spec
  describe "solution784" Solution784Spec.spec


