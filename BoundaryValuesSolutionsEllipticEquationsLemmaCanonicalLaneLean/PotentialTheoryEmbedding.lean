import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure PotentialTheoryPackage where
  greenFunction : Type u
  poissonKernel : Type v
  harmonicMeasure : Type w
  capacity : Type x
  greenFunctionExists : Prop
  poissonKernelRepresents : Prop
  harmonicMeasureBoundary : Prop
  capacityNondegenerate : Prop
  greenFunctionExistsTerm : greenFunctionExists
  poissonKernelRepresentsTerm : poissonKernelRepresents
  harmonicMeasureBoundaryTerm : harmonicMeasureBoundary
  capacityNondegenerateTerm : capacityNondegenerate

structure PotentialTheoryEvidence (P : PotentialTheoryPackage) where
  greenFunctionExistsClosed : P.greenFunctionExists
  poissonKernelRepresentsClosed : P.poissonKernelRepresents
  harmonicMeasureBoundaryClosed : P.harmonicMeasureBoundary
  capacityNondegenerateClosed : P.capacityNondegenerate

def PotentialTheoryClosed (P : PotentialTheoryPackage) : Prop :=
  P.greenFunctionExists ∧ P.poissonKernelRepresents ∧ P.harmonicMeasureBoundary ∧ P.capacityNondegenerate

theorem potential_theory_closed_from_evidence (P : PotentialTheoryPackage) (E : PotentialTheoryEvidence P) : PotentialTheoryClosed P := by
  exact And.intro E.greenFunctionExistsClosed
    (And.intro E.poissonKernelRepresentsClosed
      (And.intro E.harmonicMeasureBoundaryClosed E.capacityNondegenerateClosed))

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse