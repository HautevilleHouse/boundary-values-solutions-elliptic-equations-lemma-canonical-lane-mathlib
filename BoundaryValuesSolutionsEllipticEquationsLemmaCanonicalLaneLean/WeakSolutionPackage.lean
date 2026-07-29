import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean.EllipticOperatorPackage
import HautevilleHouse.BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean.SobolevSpacePackage

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure WeakSolutionPackage {E : EllipticOperatorPackage} {S : SobolevSpacePackage E} where
  weakFormulation : Prop
  existenceResult : Prop
  uniquenessResult : Prop
  regularityTransfer : Prop

structure WeakSolutionEvidence {E : EllipticOperatorPackage} {S : SobolevSpacePackage E} (W : WeakSolutionPackage E S) where
  weakFormulationClosed : W.weakFormulation
  existenceResultClosed : W.existenceResult
  uniquenessResultClosed : W.uniquenessResult
  regularityTransferClosed : W.regularityTransfer

def WeakSolutionClosed {E : EllipticOperatorPackage} {S : SobolevSpacePackage E} (W : WeakSolutionPackage E S) : Prop :=
  W.weakFormulation ∧ W.existenceResult ∧ W.uniquenessResult ∧ W.regularityTransfer

theorem weak_solution_closed_from_evidence {E : EllipticOperatorPackage} {S : SobolevSpacePackage E} (W : WeakSolutionPackage E S) (Ev : WeakSolutionEvidence W) :
    WeakSolutionClosed W := by
  exact And.intro Ev.weakFormulationClosed (And.intro Ev.existenceResultClosed (And.intro Ev.uniquenessResultClosed Ev.regularityTransferClosed))

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse
