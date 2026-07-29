import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure DirichletBoundaryPackage where
  domain : Type u
  boundary : Type v
  boundaryData : Type w
  traceOperator : SobolevSpacePackage → Prop
  compatibility : Prop
  solutionExists : Prop

structure DirichletBoundaryEvidence (D : DirichletBoundaryPackage) where
  compatibilityClosed : D.compatibility
  solutionExistsClosed : D.solutionExists

def DirichletBoundaryClosed (D : DirichletBoundaryPackage) : Prop :=
  D.compatibility ∧ D.solutionExists

theorem dirichlet_boundary_closed_from_evidence (D : DirichletBoundaryPackage)
    (Ev : DirichletBoundaryEvidence D) : DirichletBoundaryClosed D := by
  exact And.intro Ev.compatibilityClosed Ev.solutionExistsClosed

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse