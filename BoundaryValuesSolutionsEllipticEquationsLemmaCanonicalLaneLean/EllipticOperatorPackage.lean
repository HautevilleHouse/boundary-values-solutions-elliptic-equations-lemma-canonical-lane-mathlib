import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure EllipticOperatorPackage where
  domainType : Type u
  operatorSymbol : Type v
  ellipticityCondition : Prop
  boundedCoefficients : Prop
  uniformEllipticity : Prop

structure EllipticOperatorEvidence (E : EllipticOperatorPackage) where
  ellipticityConditionClosed : E.ellipticityCondition
  boundedCoefficientsClosed : E.boundedCoefficients
  uniformEllipticityClosed : E.uniformEllipticity

def EllipticOperatorClosed (E : EllipticOperatorPackage) : Prop :=
  E.ellipticityCondition ∧ E.boundedCoefficients ∧ E.uniformEllipticity

theorem elliptic_operator_closed_from_evidence (E : EllipticOperatorPackage) (Ev : EllipticOperatorEvidence E) :
    EllipticOperatorClosed E := by
  exact And.intro Ev.ellipticityConditionClosed (And.intro Ev.boundedCoefficientsClosed Ev.uniformEllipticityClosed)

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse
