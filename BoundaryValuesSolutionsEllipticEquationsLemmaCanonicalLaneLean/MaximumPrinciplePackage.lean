import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean.WeakSolutionPackage

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure MaximumPrinciplePackage {E : EllipticOperatorPackage} {S : SobolevSpacePackage E} {W : WeakSolutionPackage E S} where
  weakMaximum : Prop
  strongMaximum : Prop
  uniquenessConsequence : Prop
  comparisonPrinciple : Prop

structure MaximumPrincipleEvidence {E : EllipticOperatorPackage} {S : SobolevSpacePackage E} {W : WeakSolutionPackage E S} (M : MaximumPrinciplePackage E S W) where
  weakMaximumClosed : M.weakMaximum
  strongMaximumClosed : M.strongMaximum
  uniquenessConsequenceClosed : M.uniquenessConsequence
  comparisonPrincipleClosed : M.comparisonPrinciple

def MaximumPrincipleClosed {E : EllipticOperatorPackage} {S : SobolevSpacePackage E} {W : WeakSolutionPackage E S} (M : MaximumPrinciplePackage E S W) : Prop :=
  M.weakMaximum ∧ M.strongMaximum ∧ M.uniquenessConsequence ∧ M.comparisonPrinciple

theorem maximum_principle_closed_from_evidence {E : EllipticOperatorPackage} {S : SobolevSpacePackage E} {W : WeakSolutionPackage E S} (M : MaximumPrinciplePackage E S W) (Ev : MaximumPrincipleEvidence M) :
    MaximumPrincipleClosed M := by
  exact And.intro Ev.weakMaximumClosed (And.intro Ev.strongMaximumClosed (And.intro Ev.uniquenessConsequenceClosed Ev.comparisonPrincipleClosed))

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse
