import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalCanonicalLaneLean

structure RamseyCassKoopmansModel where
  productionFunction : ℝ -> ℝ
  capitalStock : ℝ -> ℝ
  consumption : ℝ -> ℝ
  householdUtility : ℝ -> ℝ
  eulerEquation : Prop
  transversalityCondition : Prop
  steadyState : Prop

structure GrowthModelEvidence (M : RamseyCassKoopmansModel) where
  eulerEquationClosed : M.eulerEquation
  transversalityConditionClosed : M.transversalityCondition
  steadyStateClosed : M.steadyState

def GrowthModelClosed (M : RamseyCassKoopmansModel) : Prop :=
  M.eulerEquation ∧ M.transversalityCondition ∧ M.steadyState

theorem growth_model_closed_from_evidence (M : RamseyCassKoopmansModel)
    (Ev : GrowthModelEvidence M) : GrowthModelClosed M := by
  exact And.intro Ev.eulerEquationClosed
    (And.intro Ev.transversalityConditionClosed Ev.steadyStateClosed)

end EconomicsInternationalCanonicalLaneLean
end HautevilleHouse