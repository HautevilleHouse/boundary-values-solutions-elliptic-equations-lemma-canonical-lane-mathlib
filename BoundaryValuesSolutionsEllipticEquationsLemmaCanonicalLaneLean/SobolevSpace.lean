import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure SobolevSpacePackage (p : ℕ) (Ω : Type*) [MeasureTheory.MeasureSpace Ω] where
  functionSpace : Type u
  norm : functionSpace → ℝ
  completeness : Prop
  embeddingTheorems : Prop

structure SobolevSpaceEvidence {p : ℕ} {Ω : Type*} [MeasureTheory.MeasureSpace Ω] (S : SobolevSpacePackage p Ω) where
  completenessClosed : S.completeness
  embeddingTheoremsClosed : S.embeddingTheorems

def SobolevSpaceClosed {p : ℕ} {Ω : Type*} [MeasureTheory.MeasureSpace Ω] (S : SobolevSpacePackage p Ω) : Prop :=
  S.completeness ∧ S.embeddingTheorems

theorem sobolev_space_closed_from_evidence {p : ℕ} {Ω : Type*} [MeasureTheory.MeasureSpace Ω]
    (S : SobolevSpacePackage p Ω) (E : SobolevSpaceEvidence S) : SobolevSpaceClosed S := by
  exact And.intro E.completenessClosed E.embeddingTheoremsClosed

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse