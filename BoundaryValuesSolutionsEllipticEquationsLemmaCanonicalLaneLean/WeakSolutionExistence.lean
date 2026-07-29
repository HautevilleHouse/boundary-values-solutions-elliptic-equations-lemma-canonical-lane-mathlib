import HautevilleHouse.BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean.SobolevSpaceEmbeddings

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure WeakSolutionExistencePackage {G : DomainGeometryPackage} {S : SobolevSpaceEmbeddingsPackage G} where
  bilinearFormCoercive : Prop
  linearFunctionalBounded : Prop
  laxMilgramApplied : Prop

structure WeakSolutionExistenceEvidence {G : DomainGeometryPackage} {S : SobolevSpaceEmbeddingsPackage G} (W : WeakSolutionExistencePackage G S) where
  bilinearFormCoerciveClosed : W.bilinearFormCoercive
  linearFunctionalBoundedClosed : W.linearFunctionalBounded
  laxMilgramAppliedClosed : W.laxMilgramApplied

def WeakSolutionExistenceClosed {G : DomainGeometryPackage} {S : SobolevSpaceEmbeddingsPackage G} (W : WeakSolutionExistencePackage G S) : Prop :=
  W.bilinearFormCoercive ∧ W.linearFunctionalBounded ∧ W.laxMilgramApplied

theorem weak_solution_existence_closed_from_evidence {G : DomainGeometryPackage} {S : SobolevSpaceEmbeddingsPackage G} (W : WeakSolutionExistencePackage G S) (E : WeakSolutionExistenceEvidence W) : WeakSolutionExistenceClosed W := by
  exact And.intro E.bilinearFormCoerciveClosed (And.intro E.linearFunctionalBoundedClosed E.laxMilgramAppliedClosed)

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse