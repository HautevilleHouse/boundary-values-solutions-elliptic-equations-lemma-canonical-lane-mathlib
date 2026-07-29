import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure EllipticBoundaryOperator where
  domain : Type
  boundary : Type
  operator : Type
  ellipticityCondition : Prop
  boundaryCondition : Prop
  operatorSmooth : Prop
  coercivityEstimate : Prop
  domainSmooth : Prop
  boundarySmooth : Prop

structure EllipticBoundaryEvidence (E : EllipticBoundaryOperator) where
  ellipticityConditionClosed : E.ellipticityCondition
  boundaryConditionClosed : E.boundaryCondition
  operatorSmoothClosed : E.operatorSmooth
  coercivityEstimateClosed : E.coercivityEstimate
  domainSmoothClosed : E.domainSmooth
  boundarySmoothClosed : E.boundarySmooth

def EllipticBoundaryClosed (E : EllipticBoundaryOperator) : Prop :=
  E.ellipticityCondition ∧ E.boundaryCondition ∧ E.operatorSmooth ∧
  E.coercivityEstimate ∧ E.domainSmooth ∧ E.boundarySmooth

theorem elliptic_boundary_closed_from_evidence (E : EllipticBoundaryOperator)
    (Ev : EllipticBoundaryEvidence E) : EllipticBoundaryClosed E := by
  exact And.intro Ev.ellipticityConditionClosed
    (And.intro Ev.boundaryConditionClosed
      (And.intro Ev.operatorSmoothClosed
        (And.intro Ev.coercivityEstimateClosed
          (And.intro Ev.domainSmoothClosed Ev.boundarySmoothClosed))))

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse