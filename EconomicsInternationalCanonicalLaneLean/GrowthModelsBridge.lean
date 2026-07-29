import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalCanonicalLaneLean

structure GrowthModelPackage where
  productionFunction : Type u
  capitalAccumulation : Type v
  consumptionOptimization : Prop
  steadyStateExists : Prop
  transitionDynamics : Prop
  stabilityCondition : Prop

structure GrowthModelEvidence (G : GrowthModelPackage) where
  consumptionOptimizationClosed : G.consumptionOptimization
  steadyStateExistsClosed : G.steadyStateExists
  transitionDynamicsClosed : G.transitionDynamics
  stabilityConditionClosed : G.stabilityCondition

def GrowthModelClosed (G : GrowthModelPackage) : Prop :=
  G.consumptionOptimization ∧ G.steadyStateExists ∧ G.transitionDynamics ∧ G.stabilityCondition

theorem growth_model_closed_from_evidence (G : GrowthModelPackage)
    (E : GrowthModelEvidence G) : GrowthModelClosed G := by
  exact And.intro E.consumptionOptimizationClosed
    (And.intro E.steadyStateExistsClosed
      (And.intro E.transitionDynamicsClosed E.stabilityConditionClosed))

end EconomicsInternationalCanonicalLaneLean
end HautevilleHouse