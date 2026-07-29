import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalCanonicalLaneLean

structure ArrowDebreuEquilibrium where
  commoditySpace : Type u
  agents : Type v
  endowments : agents -> commoditySpace
  preferences : agents -> commoditySpace -> Prop
  priceVector : commoditySpace -> ℝ
  allocation : agents -> commoditySpace
  budgetConstraint : Prop
  preferenceMaximization : Prop
  marketClearing : Prop

structure ArrowDebreuEvidence (E : ArrowDebreuEquilibrium) where
  budgetConstraintClosed : E.budgetConstraint
  preferenceMaximizationClosed : E.preferenceMaximization
  marketClearingClosed : E.marketClearing

def ArrowDebreuClosed (E : ArrowDebreuEquilibrium) : Prop :=
  E.budgetConstraint ∧ E.preferenceMaximization ∧ E.marketClearing

theorem arrow_debreu_closed_from_evidence (E : ArrowDebreuEquilibrium)
    (Ev : ArrowDebreuEvidence E) : ArrowDebreuClosed E := by
  exact And.intro Ev.budgetConstraintClosed
    (And.intro Ev.preferenceMaximizationClosed Ev.marketClearingClosed)

end EconomicsInternationalCanonicalLaneLean
end HautevilleHouse