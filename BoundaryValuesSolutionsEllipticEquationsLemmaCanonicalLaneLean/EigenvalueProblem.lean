import HautevilleHouse.BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean.MaximalPrinciple

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure EigenvalueProblemPackage {G : DomainGeometryPackage} {S : SobolevSpaceEmbeddingsPackage G} {W : WeakSolutionExistencePackage G S} {B : BoundaryRegularityPackage G S W} {M : MaximalPrinciplePackage G S W B} where
  compactResolvent : Prop
  discreteSpectrum : Prop
  firstEigenvaluePositivity : Prop

structure EigenvalueProblemEvidence {G : DomainGeometryPackage} {S : SobolevSpaceEmbeddingsPackage G} {W : WeakSolutionExistencePackage G S} {B : BoundaryRegularityPackage G S W} {M : MaximalPrinciplePackage G S W B} (E : EigenvalueProblemPackage G S W B M) where
  compactResolventClosed : E.compactResolvent
  discreteSpectrumClosed : E.discreteSpectrum
  firstEigenvaluePositivityClosed : E.firstEigenvaluePositivity

def EigenvalueProblemClosed {G : DomainGeometryPackage} {S : SobolevSpaceEmbeddingsPackage G} {W : WeakSolutionExistencePackage G S} {B : BoundaryRegularityPackage G S W} {M : MaximalPrinciplePackage G S W B} (E : EigenvalueProblemPackage G S W B M) : Prop :=
  E.compactResolvent ∧ E.discreteSpectrum ∧ E.firstEigenvaluePositivity

theorem eigenvalue_problem_closed_from_evidence {G : DomainGeometryPackage} {S : SobolevSpaceEmbeddingsPackage G} {W : WeakSolutionExistencePackage G S} {B : BoundaryRegularityPackage G S W} {M : MaximalPrinciplePackage G S W B} (E : EigenvalueProblemPackage G S W B M) (Ev : EigenvalueProblemEvidence E) : EigenvalueProblemClosed E := by
  exact And.intro Ev.compactResolventClosed (And.intro Ev.discreteSpectrumClosed Ev.firstEigenvaluePositivityClosed)

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse