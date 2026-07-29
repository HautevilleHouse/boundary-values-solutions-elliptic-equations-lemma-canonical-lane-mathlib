import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure LaxMilgramPackage (V : Type*) [SeminormedAddCommGroup V] where
  bilinearForm : V → V → ℝ
  continuous : Prop
  coercive : Prop
  uniqueSolution : Prop

structure LaxMilgramEvidence {V : Type*} [SeminormedAddCommGroup V] (L : LaxMilgramPackage V) where
  continuousClosed : L.continuous
  coerciveClosed : L.coercive
  uniqueSolutionClosed : L.uniqueSolution

def LaxMilgramClosed {V : Type*} [SeminormedAddCommGroup V] (L : LaxMilgramPackage V) : Prop :=
  L.continuous ∧ L.coercive ∧ L.uniqueSolution

theorem lax_milgram_closed_from_evidence {V : Type*} [SeminormedAddCommGroup V]
    (L : LaxMilgramPackage V) (E : LaxMilgramEvidence L) : LaxMilgramClosed L := by
  exact And.intro E.continuousClosed (And.intro E.coerciveClosed E.uniqueSolutionClosed)

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse