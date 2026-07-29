import HautevilleHouse.BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean.WeakSolutionExistence

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure BoundaryRegularityPackage {G : DomainGeometryPackage} {S : SobolevSpaceEmbeddingsPackage G} {W : WeakSolutionExistencePackage G S} where
  interiorRegularity : Prop
  boundaryRegularity : Prop
  globalSobolevEstimate : Prop

structure BoundaryRegularityEvidence {G : DomainGeometryPackage} {S : SobolevSpaceEmbeddingsPackage G} {W : WeakSolutionExistencePackage G S} (B : BoundaryRegularityPackage G S W) where
  interiorRegularityClosed : B.interiorRegularity
  boundaryRegularityClosed : B.boundaryRegularity
  globalSobolevEstimateClosed : B.globalSobolevEstimate

def BoundaryRegularityClosed {G : DomainGeometryPackage} {S : SobolevSpaceEmbeddingsPackage G} {W : WeakSolutionExistencePackage G S} (B : BoundaryRegularityPackage G S W) : Prop :=
  B.interiorRegularity ∧ B.boundaryRegularity ∧ B.globalSobolevEstimate

theorem boundary_regularity_closed_from_evidence {G : DomainGeometryPackage} {S : SobolevSpaceEmbeddingsPackage G} {W : WeakSolutionExistencePackage G S} (B : BoundaryRegularityPackage G S W) (E : BoundaryRegularityEvidence B) : BoundaryRegularityClosed B := by
  exact And.intro E.interiorRegularityClosed (And.intro E.boundaryRegularityClosed E.globalSobolevEstimateClosed)

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse