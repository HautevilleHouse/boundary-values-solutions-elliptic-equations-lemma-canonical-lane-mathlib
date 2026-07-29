import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure EllipticRegularityPackage where
  weakSolution : Prop
  interiorRegularity : Prop
  boundaryRegularity : Prop
  schauderEstimates : Prop
  bootstrapping : Prop

structure EllipticRegularityEvidence (E : EllipticRegularityPackage) where
  weakSolutionClosed : E.weakSolution
  interiorRegularityClosed : E.interiorRegularity
  boundaryRegularityClosed : E.boundaryRegularity
  schauderEstimatesClosed : E.schauderEstimates
  bootstrappingClosed : E.bootstrapping

def EllipticRegularityClosed (E : EllipticRegularityPackage) : Prop :=
  E.weakSolution ∧ E.interiorRegularity ∧ E.boundaryRegularity ∧ E.schauderEstimates ∧ E.bootstrapping

theorem elliptic_regularity_closed_from_evidence (E : EllipticRegularityPackage) (ev : EllipticRegularityEvidence E) :
    EllipticRegularityClosed E := by
  exact And.intro ev.weakSolutionClosed
    (And.intro ev.interiorRegularityClosed
      (And.intro ev.boundaryRegularityClosed
        (And.intro ev.schauderEstimatesClosed ev.bootstrappingClosed)))

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse