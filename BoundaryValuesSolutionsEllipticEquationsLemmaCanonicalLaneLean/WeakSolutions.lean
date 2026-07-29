import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure WeakSolutionPackage where
  ellipticOperator : EllipticOperatorPackage
  sobolevSpace : SobolevSpacePackage
  weakFormulation : Prop
  existence : Prop
  uniqueness : Prop
  regularity : Prop

structure WeakSolutionEvidence (W : WeakSolutionPackage) where
  weakFormulationClosed : W.weakFormulation
  existenceClosed : W.existence
  uniquenessClosed : W.uniqueness
  regularityClosed : W.regularity

def WeakSolutionClosed (W : WeakSolutionPackage) : Prop :=
  W.weakFormulation ∧ W.existence ∧ W.uniqueness ∧ W.regularity

theorem weak_solution_closed_from_evidence (W : WeakSolutionPackage)
    (Ev : WeakSolutionEvidence W) : WeakSolutionClosed W := by
  exact And.intro Ev.weakFormulationClosed
    (And.intro Ev.existenceClosed
      (And.intro Ev.uniquenessClosed Ev.regularityClosed))

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse