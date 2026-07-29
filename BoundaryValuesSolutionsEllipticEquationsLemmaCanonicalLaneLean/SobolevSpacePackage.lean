import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean.EllipticOperatorPackage

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure SobolevSpacePackage {E : EllipticOperatorPackage} where
  sobolevIndex : Nat
  embeddingTheorem : Prop
  compactEmbedding : Prop
  normBound : Prop

structure SobolevSpaceEvidence {E : EllipticOperatorPackage} (S : SobolevSpacePackage E) where
  embeddingTheoremClosed : S.embeddingTheorem
  compactEmbeddingClosed : S.compactEmbedding
  normBoundClosed : S.normBound

def SobolevSpaceClosed {E : EllipticOperatorPackage} (S : SobolevSpacePackage E) : Prop :=
  S.embeddingTheorem ∧ S.compactEmbedding ∧ S.normBound

theorem sobolev_space_closed_from_evidence {E : EllipticOperatorPackage} (S : SobolevSpacePackage E) (Ev : SobolevSpaceEvidence S) :
    SobolevSpaceClosed S := by
  exact And.intro Ev.embeddingTheoremClosed (And.intro Ev.compactEmbeddingClosed Ev.normBoundClosed)

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse
