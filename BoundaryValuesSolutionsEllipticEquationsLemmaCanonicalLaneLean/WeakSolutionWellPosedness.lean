import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure WeakSolutionWellPosednessPackage where
  variationalFormulation : Prop
  bilinearFormCoercive : Prop
  linearFunctionalBounded : Prop
  laxMilgramApplied : Prop
  solutionExistence : Prop
  solutionUniqueness : Prop
  stabilityEstimate : Prop

structure WeakSolutionWellPosednessEvidence (W : WeakSolutionWellPosednessPackage) where
  variationalFormulationClosed : W.variationalFormulation
  bilinearFormCoerciveClosed : W.bilinearFormCoercive
  linearFunctionalBoundedClosed : W.linearFunctionalBounded
  laxMilgramAppliedClosed : W.laxMilgramApplied
  solutionExistenceClosed : W.solutionExistence
  solutionUniquenessClosed : W.solutionUniqueness
  stabilityEstimateClosed : W.stabilityEstimate

def WeakSolutionWellPosednessClosed (W : WeakSolutionWellPosednessPackage) : Prop :=
  W.variationalFormulation ∧ W.bilinearFormCoercive ∧
  W.linearFunctionalBounded ∧ W.laxMilgramApplied ∧
  W.solutionExistence ∧ W.solutionUniqueness ∧ W.stabilityEstimate

theorem weak_solution_well_posedness_closed_from_evidence
    (W : WeakSolutionWellPosednessPackage)
    (Ev : WeakSolutionWellPosednessEvidence W) : WeakSolutionWellPosednessClosed W := by
  exact And.intro Ev.variationalFormulationClosed
    (And.intro Ev.bilinearFormCoerciveClosed
      (And.intro Ev.linearFunctionalBoundedClosed
        (And.intro Ev.laxMilgramAppliedClosed
          (And.intro Ev.solutionExistenceClosed
            (And.intro Ev.solutionUniquenessClosed Ev.stabilityEstimateClosed)))))

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse