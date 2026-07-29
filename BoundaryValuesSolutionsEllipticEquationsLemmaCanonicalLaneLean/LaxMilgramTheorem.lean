import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure LaxMilgramPackage where
  bilinearFormCoercive : Prop
  bilinearFormBounded : Prop
  linearFunctionalBounded : Prop
  uniqueSolution : Prop
  stability : Prop

structure LaxMilgramEvidence (L : LaxMilgramPackage) where
  bilinearFormCoerciveClosed : L.bilinearFormCoercive
  bilinearFormBoundedClosed : L.bilinearFormBounded
  linearFunctionalBoundedClosed : L.linearFunctionalBounded
  uniqueSolutionClosed : L.uniqueSolution
  stabilityClosed : L.stability

def LaxMilgramClosed (L : LaxMilgramPackage) : Prop :=
  L.bilinearFormCoercive ∧ L.bilinearFormBounded ∧ L.linearFunctionalBounded ∧ L.uniqueSolution ∧ L.stability

theorem lax_milgram_closed_from_evidence (L : LaxMilgramPackage) (ev : LaxMilgramEvidence L) :
    LaxMilgramClosed L := by
  exact And.intro ev.bilinearFormCoerciveClosed
    (And.intro ev.bilinearFormBoundedClosed
      (And.intro ev.linearFunctionalBoundedClosed
        (And.intro ev.uniqueSolutionClosed ev.stabilityClosed)))

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse