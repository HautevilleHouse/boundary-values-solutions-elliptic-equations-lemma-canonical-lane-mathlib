import HautevilleHouse.BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean.EllipticPDE

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

inductive BoundaryType where
  | Dirichlet
  | Neumann
  | Robin

def BoundaryType.desc (b : BoundaryType) : String :=
  match b with
  | Dirichlet => "Dirichlet"
  | Neumann => "Neumann"
  | Robin => "Robin"

structure BoundaryCondition (E : EllipticOperator) where
  boundaryType : BoundaryType
  boundaryData : E.domain → E.codomain
  smoothness : Prop
  compatibilityWithPDE : Prop

structure BoundaryConditionEvidence (E : EllipticOperator) (B : BoundaryCondition E) where
  smoothnessClosed : B.smoothness
  compatibilityWithPDEClosed : B.compatibilityWithPDE

def BoundaryConditionClosed (E : EllipticOperator) (B : BoundaryCondition E) : Prop :=
  B.smoothness ∧ B.compatibilityWithPDE

theorem boundary_condition_closed_from_evidence (E : EllipticOperator) (B : BoundaryCondition E) (Ev : BoundaryConditionEvidence E B) : BoundaryConditionClosed E B := by
  exact And.intro Ev.smoothnessClosed Ev.compatibilityWithPDEClosed

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse
