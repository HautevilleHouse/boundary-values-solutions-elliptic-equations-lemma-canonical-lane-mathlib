import HautevilleHouse.BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean.WeakSolution

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure RegularityResult (E : EllipticOperator) (S : SobolevSpace E) (B : BoundaryCondition E) (W : WeakSolution E S B) where
  interiorRegularity : Prop
  boundaryRegularity : Prop
  schauderEstimates : Prop
  hölderContinuity : Prop

structure RegularityEvidence (E : EllipticOperator) (S : SobolevSpace E) (B : BoundaryCondition E) (W : WeakSolution E S B) (R : RegularityResult E S B W) where
  interiorRegularityClosed : R.interiorRegularity
  boundaryRegularityClosed : R.boundaryRegularity
  schauderEstimatesClosed : R.schauderEstimates
  hölderContinuityClosed : R.hölderContinuity

def RegularityClosed (E : EllipticOperator) (S : SobolevSpace E) (B : BoundaryCondition E) (W : WeakSolution E S B) (R : RegularityResult E S B W) : Prop :=
  R.interiorRegularity ∧ R.boundaryRegularity ∧ R.schauderEstimates ∧ R.hölderContinuity

theorem regularity_closed_from_evidence (E : EllipticOperator) (S : SobolevSpace E) (B : BoundaryCondition E) (W : WeakSolution E S B) (R : RegularityResult E S B W) (Ev : RegularityEvidence E S B W R) : RegularityClosed E S B W R := by
  exact And.intro Ev.interiorRegularityClosed
    (And.intro Ev.boundaryRegularityClosed
      (And.intro Ev.schauderEstimatesClosed Ev.hölderContinuityClosed))

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse
