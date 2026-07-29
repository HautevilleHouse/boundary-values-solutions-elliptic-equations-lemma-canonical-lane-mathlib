import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean.BoundaryValueProblemPackage

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure FredholmAlternativePackage {E : EllipticOperatorPackage} {S : SobolevSpacePackage E} {W : WeakSolutionPackage E S} {R : EllipticRegularityPackage E S W} {B : BoundaryValueProblemPackage E S W R} where
  fredholmIndex : Int
  nullspaceDimension : Nat
  rangeClosed : Prop
  alternativeCondition : Prop

structure FredholmAlternativeEvidence {E : EllipticOperatorPackage} {S : SobolevSpacePackage E} {W : WeakSolutionPackage E S} {R : EllipticRegularityPackage E S W} {B : BoundaryValueProblemPackage E S W R} (F : FredholmAlternativePackage E S W R B) where
  nullspaceDimensionClosed : F.nullspaceDimension = Nat.succ 0 → Prop
  rangeClosedClosed : F.rangeClosed
  alternativeConditionClosed : F.alternativeCondition

def FredholmAlternativeClosed {E : EllipticOperatorPackage} {S : SobolevSpacePackage E} {W : WeakSolutionPackage E S} {R : EllipticRegularityPackage E S W} {B : BoundaryValueProblemPackage E S W R} (F : FredholmAlternativePackage E S W R B) : Prop :=
  F.rangeClosed ∧ F.alternativeCondition

theorem fredholm_alternative_closed_from_evidence {E : EllipticOperatorPackage} {S : SobolevSpacePackage E} {W : WeakSolutionPackage E S} {R : EllipticRegularityPackage E S W} {B : BoundaryValueProblemPackage E S W R} (F : FredholmAlternativePackage E S W R B) (Ev : FredholmAlternativeEvidence F) :
    FredholmAlternativeClosed F := by
  exact And.intro Ev.rangeClosedClosed Ev.alternativeConditionClosed

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse
