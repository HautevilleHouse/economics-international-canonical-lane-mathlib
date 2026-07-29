import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalCanonicalLaneLean

structure LucasAssetPricingModel where
  endowmentProcess : ℕ -> ℝ
  representativeUtility : ℝ -> ℝ
  discountFactor : ℝ
  equilibriumPrice : ℝ -> ℝ
  eulerEquation : Prop
  noArbitrage : Prop
  marketClearing : Prop

structure AssetPricingEvidence (M : LucasAssetPricingModel) where
  eulerEquationClosed : M.eulerEquation
  noArbitrageClosed : M.noArbitrage
  marketClearingClosed : M.marketClearing

def AssetPricingClosed (M : LucasAssetPricingModel) : Prop :=
  M.eulerEquation ∧ M.noArbitrage ∧ M.marketClearing

theorem asset_pricing_closed_from_evidence (M : LucasAssetPricingModel)
    (Ev : AssetPricingEvidence M) : AssetPricingClosed M := by
  exact And.intro Ev.eulerEquationClosed
    (And.intro Ev.noArbitrageClosed Ev.marketClearingClosed)

end EconomicsInternationalCanonicalLaneLean
end HautevilleHouse