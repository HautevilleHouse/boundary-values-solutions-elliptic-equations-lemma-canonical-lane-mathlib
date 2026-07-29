import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure BoundaryValuePackage where
  domain : Type u
  domainTopology : TopologicalSpace domain
  boundary : Set domain
  ellipticOperator : Type v
  boundaryCondition : Type w
  solutionSpace : Type x
  interiorRegularity : Prop
  boundaryTrace : Prop
  uniqueSolvability : Prop
  weakMaximumPrinciple : Prop
  interiorRegularityTerm : interiorRegularity
  boundaryTraceTerm : boundaryTrace
  uniqueSolvabilityTerm : uniqueSolvability
  weakMaximumPrincipleTerm : weakMaximumPrinciple

structure BoundaryValueEvidence (B : BoundaryValuePackage) where
  interiorRegularityClosed : B.interiorRegularity
  boundaryTraceClosed : B.boundaryTrace
  uniqueSolvabilityClosed : B.uniqueSolvability
  weakMaximumPrincipleClosed : B.weakMaximumPrinciple

def BoundaryValueClosed (B : BoundaryValuePackage) : Prop :=
  B.interiorRegularity ∧ B.boundaryTrace ∧ B.uniqueSolvability ∧ B.weakMaximumPrinciple

theorem boundary_value_closed_from_evidence (B : BoundaryValuePackage) (E : BoundaryValueEvidence B) : BoundaryValueClosed B := by
  exact And.intro E.interiorRegularityClosed
    (And.intro E.boundaryTraceClosed
      (And.intro E.uniqueSolvabilityClosed E.weakMaximumPrincipleClosed))

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse