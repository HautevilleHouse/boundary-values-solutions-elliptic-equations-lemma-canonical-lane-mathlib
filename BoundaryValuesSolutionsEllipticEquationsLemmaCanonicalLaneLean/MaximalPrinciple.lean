import HautevilleHouse.BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean.BoundaryRegularity

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure MaximalPrinciplePackage {G : DomainGeometryPackage} {S : SobolevSpaceEmbeddingsPackage G} {W : WeakSolutionExistencePackage G S} {B : BoundaryRegularityPackage G S W} where
  weakMaximum : Prop
  strongMaximum : Prop
  comparisonPrinciple : Prop

structure MaximalPrincipleEvidence {G : DomainGeometryPackage} {S : SobolevSpaceEmbeddingsPackage G} {W : WeakSolutionExistencePackage G S} {B : BoundaryRegularityPackage G S W} (M : MaximalPrinciplePackage G S W B) where
  weakMaximumClosed : M.weakMaximum
  strongMaximumClosed : M.strongMaximum
  comparisonPrincipleClosed : M.comparisonPrinciple

def MaximalPrincipleClosed {G : DomainGeometryPackage} {S : SobolevSpaceEmbeddingsPackage G} {W : WeakSolutionExistencePackage G S} {B : BoundaryRegularityPackage G S W} (M : MaximalPrinciplePackage G S W B) : Prop :=
  M.weakMaximum ∧ M.strongMaximum ∧ M.comparisonPrinciple

theorem maximal_principle_closed_from_evidence {G : DomainGeometryPackage} {S : SobolevSpaceEmbeddingsPackage G} {W : WeakSolutionExistencePackage G S} {B : BoundaryRegularityPackage G S W} (M : MaximalPrinciplePackage G S W B) (E : MaximalPrincipleEvidence M) : MaximalPrincipleClosed M := by
  exact And.intro E.weakMaximumClosed (And.intro E.strongMaximumClosed E.comparisonPrincipleClosed)

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse