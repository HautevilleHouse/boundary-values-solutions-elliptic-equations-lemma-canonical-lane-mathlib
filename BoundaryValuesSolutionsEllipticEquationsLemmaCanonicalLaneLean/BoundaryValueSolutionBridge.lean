import canonicalLaneMathlib.AdmissibleClass
import BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean.EllipticBoundaryOperator
import BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean.SobolevTrace
import BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean.WeakSolutionWellPosedness
import BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean.RegularityTheory

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure BoundaryValueSolutionBridge where
  operator : EllipticBoundaryOperator
  operatorEvidence : EllipticBoundaryEvidence operator
  sobolevTrace : SobolevTracePackage
  sobolevTraceEvidence : SobolevTraceEvidence sobolevTrace
  wellPosedness : WeakSolutionWellPosednessPackage
  wellPosednessEvidence : WeakSolutionWellPosednessEvidence wellPosedness
  regularity : RegularityTheoryPackage
  regularityEvidence : RegularityTheoryEvidence regularity

def SolutionBridgeClosed (B : BoundaryValueSolutionBridge) : Prop :=
  EllipticBoundaryClosed B.operator ∧ SobolevTraceClosed B.sobolevTrace ∧
  WeakSolutionWellPosednessClosed B.wellPosedness ∧ RegularityTheoryClosed B.regularity

theorem solution_bridge_closed_from_evidence (B : BoundaryValueSolutionBridge) :
    SolutionBridgeClosed B := by
  exact And.intro (elliptic_boundary_closed_from_evidence B.operator B.operatorEvidence)
    (And.intro (sobolev_trace_closed_from_evidence B.sobolevTrace B.sobolevTraceEvidence)
      (And.intro (weak_solution_well_posedness_closed_from_evidence B.wellPosedness B.wellPosednessEvidence)
        (regularity_theory_closed_from_evidence B.regularity B.regularityEvidence)))

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse