import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean

structure LayerPotentialPackage where
  singleLayerPotential : Type u
  doubleLayerPotential : Type v
  jumpRelation : Type w
  continuityAcrossBoundary : Type x
  singleLayerBounded : Prop
  doubleLayerBounded : Prop
  jumpRelationHypoelliptic : Prop
  continuityAcrossBoundaryHolds : Prop
  singleLayerBoundedTerm : singleLayerBounded
  doubleLayerBoundedTerm : doubleLayerBounded
  jumpRelationHypoellipticTerm : jumpRelationHypoelliptic
  continuityAcrossBoundaryHoldsTerm : continuityAcrossBoundaryHolds

structure LayerPotentialEvidence (L : LayerPotentialPackage) where
  singleLayerBoundedClosed : L.singleLayerBounded
  doubleLayerBoundedClosed : L.doubleLayerBounded
  jumpRelationHypoellipticClosed : L.jumpRelationHypoelliptic
  continuityAcrossBoundaryHoldsClosed : L.continuityAcrossBoundaryHolds

def LayerPotentialClosed (L : LayerPotentialPackage) : Prop :=
  L.singleLayerBounded ∧ L.doubleLayerBounded ∧ L.jumpRelationHypoelliptic ∧ L.continuityAcrossBoundaryHolds

theorem layer_potential_closed_from_evidence (L : LayerPotentialPackage) (E : LayerPotentialEvidence L) : LayerPotentialClosed L := by
  exact And.intro E.singleLayerBoundedClosed
    (And.intro E.doubleLayerBoundedClosed
      (And.intro E.jumpRelationHypoellipticClosed E.continuityAcrossBoundaryHoldsClosed))

end BoundaryValuesSolutionsEllipticEquationsLemmaCanonicalLaneLean
end HautevilleHouse