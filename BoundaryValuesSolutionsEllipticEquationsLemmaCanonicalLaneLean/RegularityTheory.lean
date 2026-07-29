import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure RegularityTheoryPackage where
  interiorRegularity : Prop
  boundaryRegularity : Prop
  higherRegularity : Prop
  schauderEstimates : Prop
  bootstrapArgument : Prop

structure RegularityTheoryEvidence (R : RegularityTheoryPackage) where
  interiorRegularityClosed : R.interiorRegularity
  boundaryRegularityClosed : R.boundaryRegularity
  higherRegularityClosed : R.higherRegularity
  schauderEstimatesClosed : R.schauderEstimates
  bootstrapArgumentClosed : R.bootstrapArgument

def RegularityTheoryClosed (R : RegularityTheoryPackage) : Prop :=
  R.interiorRegularity ∧ R.boundaryRegularity ∧
  R.higherRegularity ∧ R.schauderEstimates ∧ R.bootstrapArgument

theorem regularity_theory_closed_from_evidence (R : RegularityTheoryPackage)
    (Ev : RegularityTheoryEvidence R) : RegularityTheoryClosed R := by
  exact And.intro Ev.interiorRegularityClosed
    (And.intro Ev.boundaryRegularityClosed
      (And.intro Ev.higherRegularityClosed
        (And.intro Ev.schauderEstimatesClosed Ev.bootstrapArgumentClosed)))

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse