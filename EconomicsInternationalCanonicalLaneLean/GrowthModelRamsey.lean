import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalCanonicalLaneLean

structure ProductionFunction where
  capital : Type u
  output : Type u
  f : capital → output
  diminishingReturns : ConcaveOn ℝ capital f
  inadaConditions : (lim_{k→0} f'(k) = ∞) ∧ (lim_{k→∞} f'(k) = 0)

structure RamseyModel (P : ProductionFunction) where
  consumption : ℝ → ℝ
  capitalStock : ℝ → ℝ
  utility : ℝ → ℝ
  discountRate : ℝ
  utilityFunction : ℝ → ℝ
  discountFactor : ℝ → ℝ
  initialCapital : ℝ
  eulerEquation : ∀ t, (utilityFunction derivative at consumption t) * (discountFactor t) = 
    (utilityFunction derivative at consumption (t+1)) * (P.f derivative at capitalStock t + 1 - depreciation)

structure RamseyEquilibrium (P : ProductionFunction) (M : RamseyModel P) where
  balancedGrowthPath : Prop
  saddlePathStability : Prop
  goldenRuleCapital : ℝ
  modifiedGoldenRuleCapital : ℝ

def RamseyClosed (P : ProductionFunction) (M : RamseyModel P) (E : RamseyEquilibrium P M) : Prop :=
  E.balancedGrowthPath ∧ E.saddlePathStability

theorem ramsey_closed_from_evidence (P : ProductionFunction) (M : RamseyModel P) (E : RamseyEquilibrium P M) :
    RamseyClosed P M E := by
  exact And.intro E.balancedGrowthPath E.saddlePathStability

end EconomicsInternationalCanonicalLaneLean
end HautevilleHouse