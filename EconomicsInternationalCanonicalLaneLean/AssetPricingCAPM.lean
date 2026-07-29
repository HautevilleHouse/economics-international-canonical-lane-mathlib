import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalCanonicalLaneLean

structure Asset where
  return : ℝ → ℝ  -- return at each state
  expectedReturn : ℝ
  variance : ℝ

structure Portfolio (assets : List Asset) where
  weights : assets.length → ℝ
  expectedReturn : ℝ
  variance : ℝ

structure MarketPortfolio (assets : List Asset) (p : Portfolio assets) where
  marketReturn : ℝ
  marketVariance : ℝ

structure CapitalAssetPricingModel (assets : List Asset) (p : Portfolio assets) (m : MarketPortfolio assets p) where
  riskFreeRate : ℝ
  beta : assets → ℝ
  securityMarketLine : ∀ a : assets, a.expectedReturn = riskFreeRate + beta a * (m.marketReturn - riskFreeRate)
  betaDef : ∀ a : assets, beta a = (covariance a.return m.marketReturn) / m.marketVariance

def CAPMClosed (assets : List Asset) (p : Portfolio assets) (m : MarketPortfolio assets p) (c : CapitalAssetPricingModel assets p m) : Prop :=
  ∀ a : assets, c.securityMarketLine a

theorem capm_closed_from_evidence (assets : List Asset) (p : Portfolio assets) (m : MarketPortfolio assets p)
    (c : CapitalAssetPricingModel assets p m) (h : ∀ a : assets, c.securityMarketLine a) :
    CAPMClosed assets p m c := by
  exact h

end EconomicsInternationalCanonicalLaneLean
end HautevilleHouse