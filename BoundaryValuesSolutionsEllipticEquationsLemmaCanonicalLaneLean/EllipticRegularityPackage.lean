import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean.WeakSolutionPackage

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure EllipticRegularityPackage {E : EllipticOperatorPackage} {S : SobolevSpacePackage E} {W : WeakSolutionPackage E S} where
  interiorRegularity : Prop
  boundaryRegularity : Prop
  schauderEstimates : Prop
  hölderContinuity : Prop

structure EllipticRegularityEvidence {E : EllipticOperatorPackage} {S : SobolevSpacePackage E} {W : WeakSolutionPackage E S} (R : EllipticRegularityPackage E S W) where
  interiorRegularityClosed : R.interiorRegularity
  boundaryRegularityClosed : R.boundaryRegularity
  schauderEstimatesClosed : R.schauderEstimates
  hölderContinuityClosed : R.hölderContinuity

def EllipticRegularityClosed {E : EllipticOperatorPackage} {S : SobolevSpacePackage E} {W : WeakSolutionPackage E S} (R : EllipticRegularityPackage E S W) : Prop :=
  R.interiorRegularity ∧ R.boundaryRegularity ∧ R.schauderEstimates ∧ R.hölderContinuity

theorem elliptic_regularity_closed_from_evidence {E : EllipticOperatorPackage} {S : SobolevSpacePackage E} {W : WeakSolutionPackage E S} (R : EllipticRegularityPackage E S W) (Ev : EllipticRegularityEvidence R) :
    EllipticRegularityClosed R := by
  exact And.intro Ev.interiorRegularityClosed (And.intro Ev.boundaryRegularityClosed (And.intro Ev.schauderEstimatesClosed Ev.hölderContinuityClosed))

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse
