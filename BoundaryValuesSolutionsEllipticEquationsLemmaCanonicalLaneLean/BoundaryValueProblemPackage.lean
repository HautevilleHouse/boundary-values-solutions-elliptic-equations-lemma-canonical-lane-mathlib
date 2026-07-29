import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean.EllipticRegularityPackage

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure BoundaryValueProblemPackage {E : EllipticOperatorPackage} {S : SobolevSpacePackage E} {W : WeakSolutionPackage E S} {R : EllipticRegularityPackage E S W} where
  boundaryCondition : Prop
  wellPosedness : Prop
  solutionRepresentation : Prop
  stabilityEstimate : Prop

structure BoundaryValueProblemEvidence {E : EllipticOperatorPackage} {S : SobolevSpacePackage E} {W : WeakSolutionPackage E S} {R : EllipticRegularityPackage E S W} (B : BoundaryValueProblemPackage E S W R) where
  boundaryConditionClosed : B.boundaryCondition
  wellPosednessClosed : B.wellPosedness
  solutionRepresentationClosed : B.solutionRepresentation
  stabilityEstimateClosed : B.stabilityEstimate

def BoundaryValueProblemClosed {E : EllipticOperatorPackage} {S : SobolevSpacePackage E} {W : WeakSolutionPackage E S} {R : EllipticRegularityPackage E S W} (B : BoundaryValueProblemPackage E S W R) : Prop :=
  B.boundaryCondition ∧ B.wellPosedness ∧ B.solutionRepresentation ∧ B.stabilityEstimate

theorem boundary_value_problem_closed_from_evidence {E : EllipticOperatorPackage} {S : SobolevSpacePackage E} {W : WeakSolutionPackage E S} {R : EllipticRegularityPackage E S W} (B : BoundaryValueProblemPackage E S W R) (Ev : BoundaryValueProblemEvidence B) :
    BoundaryValueProblemClosed B := by
  exact And.intro Ev.boundaryConditionClosed (And.intro Ev.wellPosednessClosed (And.intro Ev.solutionRepresentationClosed Ev.stabilityEstimateClosed))

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse
