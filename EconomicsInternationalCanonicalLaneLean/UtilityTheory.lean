import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalCanonicalLaneLean

structure UtilityRepresentation where
  consumptionSet : Type u
  preferenceRelation : consumptionSet -> consumptionSet -> Prop
  utilityFunction : consumptionSet -> ℝ
  representationProperty : Prop
  continuity : Prop
  monotonicity : Prop

structure UtilityEvidence (U : UtilityRepresentation) where
  representationPropertyClosed : U.representationProperty
  continuityClosed : U.continuity
  monotonicityClosed : U.monotonicity

def UtilityRepresentationClosed (U : UtilityRepresentation) : Prop :=
  U.representationProperty ∧ U.continuity ∧ U.monotonicity

theorem utility_representation_closed_from_evidence (U : UtilityRepresentation)
    (Ev : UtilityEvidence U) : UtilityRepresentationClosed U := by
  exact And.intro Ev.representationPropertyClosed
    (And.intro Ev.continuityClosed Ev.monotonicityClosed)

end EconomicsInternationalCanonicalLaneLean
end HautevilleHouse