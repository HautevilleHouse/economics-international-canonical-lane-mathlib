import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalCanonicalLaneLean

structure ArrowDebreuMarket where
  goodSpaces : Type u
  priceSystem : Type v
  consumptionSet : Type w
  initialEndowment : Type x
  utilityFunction : Type y
  preferencesStrictlyMonotone : Prop
  marketClearingCondition : Prop
  equilibriumExists : Prop

structure ArrowDebreuEquilibriumEvidence (M : ArrowDebreuMarket) where
  preferencesStrictlyMonotoneClosed : M.preferencesStrictlyMonotone
  marketClearingConditionClosed : M.marketClearingCondition
  equilibriumExistsClosed : M.equilibriumExists

def ArrowDebreuEquilibriumClosed (M : ArrowDebreuMarket) : Prop :=
  M.preferencesStrictlyMonotone ∧ M.marketClearingCondition ∧ M.equilibriumExists

theorem arrow_debreu_equilibrium_closed_from_evidence (M : ArrowDebreuMarket)
    (E : ArrowDebreuEquilibriumEvidence M) : ArrowDebreuEquilibriumClosed M := by
  exact And.intro E.preferencesStrictlyMonotoneClosed
    (And.intro E.marketClearingConditionClosed E.equilibriumExistsClosed)

end EconomicsInternationalCanonicalLaneLean
end HautevilleHouse