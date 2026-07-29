import HautevilleHouse.BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure EllipticOperator where
  domain : Type u
  codomain : Type v
  coefficientsSmooth : Prop
  uniformEllipticity : Prop
  boundedCoefficients : Prop
  coercivity : Prop

structure EllipticPDE (E : EllipticOperator) where
  operatorApplied : E.domain → E.codomain
  sourceTerm : E.domain → E.codomain
  linearity : Prop
  solvabilityCondition : Prop

structure EllipticPDEEvidence (E : EllipticOperator) (P : EllipticPDE E) where
  coefficientsSmoothClosed : E.coefficientsSmooth
  uniformEllipticityClosed : E.uniformEllipticity
  boundedCoefficientsClosed : E.boundedCoefficients
  coercivityClosed : E.coercivity
  linearityClosed : P.linearity
  solvabilityConditionClosed : P.solvabilityCondition

def EllipticPDEClosed (E : EllipticOperator) (P : EllipticPDE E) : Prop :=
  E.coefficientsSmooth ∧ E.uniformEllipticity ∧ E.boundedCoefficients ∧ E.coercivity ∧ P.linearity ∧ P.solvabilityCondition

theorem elliptic_pde_closed_from_evidence (E : EllipticOperator) (P : EllipticPDE E) (Ev : EllipticPDEEvidence E P) : EllipticPDEClosed E P := by
  exact And.intro Ev.coefficientsSmoothClosed
    (And.intro Ev.uniformEllipticityClosed
      (And.intro Ev.boundedCoefficientsClosed
        (And.intro Ev.coercivityClosed
          (And.intro Ev.linearityClosed Ev.solvabilityConditionClosed))))

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse
