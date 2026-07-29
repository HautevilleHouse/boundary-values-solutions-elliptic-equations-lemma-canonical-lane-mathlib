import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure SobolevTracePackage where
  domain : Type
  boundary : Type
  traceOperator : Type
  extensionOperator : Type
  traceTheorem : Prop
  extensionTheorem : Prop
  compactEmbedding : Prop
  normEstimate : Prop

structure SobolevTraceEvidence (S : SobolevTracePackage) where
  traceTheoremClosed : S.traceTheorem
  extensionTheoremClosed : S.extensionTheorem
  compactEmbeddingClosed : S.compactEmbedding
  normEstimateClosed : S.normEstimate

def SobolevTraceClosed (S : SobolevTracePackage) : Prop :=
  S.traceTheorem ∧ S.extensionTheorem ∧ S.compactEmbedding ∧ S.normEstimate

theorem sobolev_trace_closed_from_evidence (S : SobolevTracePackage)
    (Ev : SobolevTraceEvidence S) : SobolevTraceClosed S := by
  exact And.intro Ev.traceTheoremClosed
    (And.intro Ev.extensionTheoremClosed
      (And.intro Ev.compactEmbeddingClosed Ev.normEstimateClosed))

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse