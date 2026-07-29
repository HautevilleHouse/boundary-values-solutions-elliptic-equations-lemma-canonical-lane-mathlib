import HautevilleHouse.BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean.Regularity

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure AprioriEstimate (E : EllipticOperator) (S : SobolevSpace E) (B : BoundaryCondition E) (W : WeakSolution E S B) (R : RegularityResult E S B W) where
  caccioppoliInequality : Prop
  energyEstimate : Prop
  maximumPrinciple : Prop
  harnackInequality : Prop

structure AprioriEstimateEvidence (E : EllipticOperator) (S : SobolevSpace E) (B : BoundaryCondition E) (W : WeakSolution E S B) (R : RegularityResult E S B W) (A : AprioriEstimate E S B W R) where
  caccioppoliInequalityClosed : A.caccioppoliInequality
  energyEstimateClosed : A.energyEstimate
  maximumPrincipleClosed : A.maximumPrinciple
  harnackInequalityClosed : A.harnackInequality

def AprioriEstimateClosed (E : EllipticOperator) (S : SobolevSpace E) (B : BoundaryCondition E) (W : WeakSolution E S B) (R : RegularityResult E S B W) (A : AprioriEstimate E S B W R) : Prop :=
  A.caccioppoliInequality ∧ A.energyEstimate ∧ A.maximumPrinciple ∧ A.harnackInequality

theorem apriori_estimate_closed_from_evidence (E : EllipticOperator) (S : SobolevSpace E) (B : BoundaryCondition E) (W : WeakSolution E S B) (R : RegularityResult E S B W) (A : AprioriEstimate E S B W R) (Ev : AprioriEstimateEvidence E S B W R A) : AprioriEstimateClosed E S B W R A := by
  exact And.intro Ev.caccioppoliInequalityClosed
    (And.intro Ev.energyEstimateClosed
      (And.intro Ev.maximumPrincipleClosed Ev.harnackInequalityClosed))

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse
