import HautevilleHouse.BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean.SobolevSpace
import HautevilleHouse.BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean.BoundaryCondition

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure WeakSolution (E : EllipticOperator) (S : SobolevSpace E) (B : BoundaryCondition E) where
  weakFormulationSatisfied : Prop
  existenceViaLaxMilgram : Prop
  uniquenessUnderConditions : Prop
  stabilityEstimate : Prop

structure WeakSolutionEvidence (E : EllipticOperator) (S : SobolevSpace E) (B : BoundaryCondition E) (W : WeakSolution E S B) where
  weakFormulationSatisfiedClosed : W.weakFormulationSatisfied
  existenceViaLaxMilgramClosed : W.existenceViaLaxMilgram
  uniquenessUnderConditionsClosed : W.uniquenessUnderConditions
  stabilityEstimateClosed : W.stabilityEstimate

def WeakSolutionClosed (E : EllipticOperator) (S : SobolevSpace E) (B : BoundaryCondition E) (W : WeakSolution E S B) : Prop :=
  W.weakFormulationSatisfied ∧ W.existenceViaLaxMilgram ∧ W.uniquenessUnderConditions ∧ W.stabilityEstimate

theorem weak_solution_closed_from_evidence (E : EllipticOperator) (S : SobolevSpace E) (B : BoundaryCondition E) (W : WeakSolution E S B) (Ev : WeakSolutionEvidence E S B W) : WeakSolutionClosed E S B W := by
  exact And.intro Ev.weakFormulationSatisfiedClosed
    (And.intro Ev.existenceViaLaxMilgramClosed
      (And.intro Ev.uniquenessUnderConditionsClosed Ev.stabilityEstimateClosed))

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse
