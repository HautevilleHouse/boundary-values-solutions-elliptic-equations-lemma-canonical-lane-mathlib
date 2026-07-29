import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure EllipticOperatorPackage where
  domain : Type u
  topology : TopologicalSpace domain
  smoothStructure : Prop
  secondOrderOperator : Type v
  uniformEllipticity : Prop
  boundedCoefficients : Prop
  smoothCoefficients : Prop

structure EllipticOperatorEvidence (E : EllipticOperatorPackage) where
  uniformEllipticityClosed : E.uniformEllipticity
  boundedCoefficientsClosed : E.boundedCoefficients
  smoothCoefficientsClosed : E.smoothCoefficients

def EllipticOperatorClosed (E : EllipticOperatorPackage) : Prop :=
  E.uniformEllipticity ∧ E.boundedCoefficients ∧ E.smoothCoefficients

theorem elliptic_operator_closed_from_evidence (E : EllipticOperatorPackage)
    (Ev : EllipticOperatorEvidence E) : EllipticOperatorClosed E := by
  exact And.intro Ev.uniformEllipticityClosed
    (And.intro Ev.boundedCoefficientsClosed Ev.smoothCoefficientsClosed)

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse