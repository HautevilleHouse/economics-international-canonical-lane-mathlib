import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalCanonicalLaneLean

structure AssetPricingPackage where
  stochasticDiscountFactor : Type u
  assetSpace : Type v
  payoffSpace : Type w
  pricingEquation : Prop
  noArbitrage : Prop
  marketCompleteness : Prop
  riskNeutralProbExists : Prop

structure AssetPricingEvidence (A : AssetPricingPackage) where
  pricingEquationClosed : A.pricingEquation
  noArbitrageClosed : A.noArbitrage
  marketCompletenessClosed : A.marketCompleteness
  riskNeutralProbExistsClosed : A.riskNeutralProbExists

def AssetPricingClosed (A : AssetPricingPackage) : Prop :=
  A.pricingEquation ∧ A.noArbitrage ∧ A.marketCompleteness ∧ A.riskNeutralProbExists

theorem asset_pricing_closed_from_evidence (A : AssetPricingPackage)
    (E : AssetPricingEvidence A) : AssetPricingClosed A := by
  exact And.intro E.pricingEquationClosed
    (And.intro E.noArbitrageClosed
      (And.intro E.marketCompletenessClosed E.riskNeutralProbExistsClosed))

end EconomicsInternationalCanonicalLaneLean
end HautevilleHouse