import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalCanonicalLaneLean

structure RicardianTradeModel where
  countries : Type u
  goods : Type v
  laborProductivity : countries -> goods -> ℝ
  laborEndowment : countries -> ℝ
  autarkyPrices : countries -> goods -> ℝ
  freeTradePrices : goods -> ℝ
  comparativeAdvantage : Prop
  gainsFromTrade : Prop
  tradeBalance : Prop

structure TradeEvidence (T : RicardianTradeModel) where
  comparativeAdvantageClosed : T.comparativeAdvantage
  gainsFromTradeClosed : T.gainsFromTrade
  tradeBalanceClosed : T.tradeBalance

def RicardianTradeClosed (T : RicardianTradeModel) : Prop :=
  T.comparativeAdvantage ∧ T.gainsFromTrade ∧ T.tradeBalance

theorem ricardian_trade_closed_from_evidence (T : RicardianTradeModel)
    (Ev : TradeEvidence T) : RicardianTradeClosed T := by
  exact And.intro Ev.comparativeAdvantageClosed
    (And.intro Ev.gainsFromTradeClosed Ev.tradeBalanceClosed)

end EconomicsInternationalCanonicalLaneLean
end HautevilleHouse