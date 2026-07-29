import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure SobolevSpacePackage where
  domain : Type u
  measure : Type v
  integrabilityExponent : Nat
  differentiabilityOrder : Nat
  embeddingTheorems : Prop
  traceOperator : Prop
  densityOfSmoothFunctions : Prop

structure SobolevSpaceEvidence (S : SobolevSpacePackage) where
  embeddingTheoremsClosed : S.embeddingTheorems
  traceOperatorClosed : S.traceOperator
  densityOfSmoothFunctionsClosed : S.densityOfSmoothFunctions

def SobolevSpaceClosed (S : SobolevSpacePackage) : Prop :=
  S.embeddingTheorems ∧ S.traceOperator ∧ S.densityOfSmoothFunctions

theorem sobolev_space_closed_from_evidence (S : SobolevSpacePackage)
    (Ev : SobolevSpaceEvidence S) : SobolevSpaceClosed S := by
  exact And.intro Ev.embeddingTheoremsClosed
    (And.intro Ev.traceOperatorClosed Ev.densityOfSmoothFunctionsClosed)

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse