import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure BoundaryTracePackage (Ω : Type*) [TopologicalSpace Ω] (∂Ω : Set Ω) where
  traceMap : Type u
  continuity : Prop
  densityOfSmoothFunctions : Prop
  traceInequality : Prop

structure BoundaryTraceEvidence {Ω : Type*} [TopologicalSpace Ω] {∂Ω : Set Ω} (B : BoundaryTracePackage Ω ∂Ω) where
  continuityClosed : B.continuity
  densityOfSmoothFunctionsClosed : B.densityOfSmoothFunctions
  traceInequalityClosed : B.traceInequality

def BoundaryTraceClosed {Ω : Type*} [TopologicalSpace Ω] {∂Ω : Set Ω} (B : BoundaryTracePackage Ω ∂Ω) : Prop :=
  B.continuity ∧ B.densityOfSmoothFunctions ∧ B.traceInequality

theorem boundary_trace_closed_from_evidence {Ω : Type*} [TopologicalSpace Ω] {∂Ω : Set Ω}
    (B : BoundaryTracePackage Ω ∂Ω) (E : BoundaryTraceEvidence B) : BoundaryTraceClosed B := by
  exact And.intro E.continuityClosed (And.intro E.densityOfSmoothFunctionsClosed E.traceInequalityClosed)

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse