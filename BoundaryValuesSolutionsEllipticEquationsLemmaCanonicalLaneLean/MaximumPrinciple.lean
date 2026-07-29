import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure MaximumPrinciplePackage where
  operator : EllipticOperatorPackage
  domainBounded : Prop
  weakPrinciple : Prop
  strongPrinciple : Prop
  applications : Prop

structure MaximumPrincipleEvidence (M : MaximumPrinciplePackage) where
  weakPrincipleClosed : M.weakPrinciple
  strongPrincipleClosed : M.strongPrinciple
  applicationsClosed : M.applications

def MaximumPrincipleClosed (M : MaximumPrinciplePackage) : Prop :=
  M.weakPrinciple ∧ M.strongPrinciple ∧ M.applications

theorem maximum_principle_closed_from_evidence (M : MaximumPrinciplePackage)
    (Ev : MaximumPrincipleEvidence M) : MaximumPrincipleClosed M := by
  exact And.intro Ev.weakPrincipleClosed
    (And.intro Ev.strongPrincipleClosed Ev.applicationsClosed)

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse