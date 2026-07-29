import HautevilleHouse.BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure SobolevSpaceEmbeddingsPackage {G : DomainGeometryPackage} where
  sobolevInequality : Prop
  compactEmbedding : Prop
  traceTheorem : Prop

structure SobolevSpaceEmbeddingsEvidence {G : DomainGeometryPackage} (S : SobolevSpaceEmbeddingsPackage G) where
  sobolevInequalityClosed : S.sobolevInequality
  compactEmbeddingClosed : S.compactEmbedding
  traceTheoremClosed : S.traceTheorem

def SobolevSpaceEmbeddingsClosed {G : DomainGeometryPackage} (S : SobolevSpaceEmbeddingsPackage G) : Prop :=
  S.sobolevInequality ∧ S.compactEmbedding ∧ S.traceTheorem

theorem sobolev_space_embeddings_closed_from_evidence {G : DomainGeometryPackage} (S : SobolevSpaceEmbeddingsPackage G) (E : SobolevSpaceEmbeddingsEvidence S) : SobolevSpaceEmbeddingsClosed S := by
  exact And.intro E.sobolevInequalityClosed (And.intro E.compactEmbeddingClosed E.traceTheoremClosed)

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse