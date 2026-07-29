import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure EllipticOperator where
  domain : Type u
  topology : TopologicalSpace domain
  operatorType : Prop
  ellipticityConstant : ℝ
  smoothCoefficients : Prop

def EllipticOperatorClosed (L : EllipticOperator) : Prop :=
  L.operatorType ∧ L.smoothCoefficients

structure BoundaryCondition where
  boundaryType : Prop
  traceCompatible : Prop
  coercive : Prop

def BoundaryConditionClosed (B : BoundaryCondition) : Prop :=
  B.boundaryType ∧ B.traceCompatible ∧ B.coercive

structure EllipticProblemPackage where
  operator : EllipticOperator
  boundaryCondition : BoundaryCondition
  sourceTerm : Prop
  solutionSpace : Type v

def EllipticProblemClosed (P : EllipticProblemPackage) : Prop :=
  EllipticOperatorClosed P.operator ∧ BoundaryConditionClosed P.boundaryCondition ∧ P.sourceTerm

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse