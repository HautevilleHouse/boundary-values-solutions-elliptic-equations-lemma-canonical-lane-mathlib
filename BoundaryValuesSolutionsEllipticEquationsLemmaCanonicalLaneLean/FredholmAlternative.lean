import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure FredholmAlternativePackage where
  operator : EllipticOperatorPackage
  sobolevSpace : SobolevSpacePackage
  indexWellDefined : Prop
  kernelFiniteDimensional : Prop
  cokernelFiniteDimensional : Prop
  alternativeHolds : Prop

structure FredholmAlternativeEvidence (F : FredholmAlternativePackage) where
  indexWellDefinedClosed : F.indexWellDefined
  kernelFiniteDimensionalClosed : F.kernelFiniteDimensional
  cokernelFiniteDimensionalClosed : F.cokernelFiniteDimensional
  alternativeHoldsClosed : F.alternativeHolds

def FredholmAlternativeClosed (F : FredholmAlternativePackage) : Prop :=
  F.indexWellDefined ∧ F.kernelFiniteDimensional ∧ F.cokernelFiniteDimensional ∧ F.alternativeHolds

theorem fredholm_alternative_closed_from_evidence (F : FredholmAlternativePackage)
    (Ev : FredholmAlternativeEvidence F) : FredholmAlternativeClosed F := by
  exact And.intro Ev.indexWellDefinedClosed
    (And.intro Ev.kernelFiniteDimensionalClosed
      (And.intro Ev.cokernelFiniteDimensionalClosed Ev.alternativeHoldsClosed))

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse