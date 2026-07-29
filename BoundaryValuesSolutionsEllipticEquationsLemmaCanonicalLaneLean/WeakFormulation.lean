import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure WeakFormulationPackage (Ω : Type*) [MeasureTheory.MeasureSpace Ω] where
  bilinearForm : Type u
  coercivity : Prop
  boundedness : Prop
  weakSolutionDefined : Prop

structure WeakFormulationEvidence {Ω : Type*} [MeasureTheory.MeasureSpace Ω] (W : WeakFormulationPackage Ω) where
  coercivityClosed : W.coercivity
  boundednessClosed : W.boundedness
  weakSolutionDefinedClosed : W.weakSolutionDefined

def WeakFormulationClosed {Ω : Type*} [MeasureTheory.MeasureSpace Ω] (W : WeakFormulationPackage Ω) : Prop :=
  W.coercivity ∧ W.boundedness ∧ W.weakSolutionDefined

theorem weak_formulation_closed_from_evidence {Ω : Type*} [MeasureTheory.MeasureSpace Ω]
    (W : WeakFormulationPackage Ω) (E : WeakFormulationEvidence W) : WeakFormulationClosed W := by
  exact And.intro E.coercivityClosed (And.intro E.boundednessClosed E.weakSolutionDefinedClosed)

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse