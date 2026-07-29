import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure EllipticBoundaryAdmittedObject where
  domain : Type u
  boundary : Type v
  ellipticOperator : Type w
  solutionSpace : Type x
  boundaryCondition : Prop
  uniqueSolution : Prop

structure AdmissibleClass where
  object : EllipticBoundaryAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (bridgeClosed A) ∧ (gateClosed A)

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse