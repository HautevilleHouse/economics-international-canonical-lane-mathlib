import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalCanonicalLaneLean

structure ConsumptionSet where
  carrier : Type u
  convexity : Convex ℝ carrier
  closedness : IsClosed carrier

structure UtilityFunction (C : ConsumptionSet) where
  u : C.carrier → ℝ
  continuity : Continuous u
  monotonicity : ∀ x y : C.carrier, x ≤ y → u x ≤ u y
  concavity : ConcaveOn ℝ C.carrier u

structure UtilityMaximizationProblem (C : ConsumptionSet) where
  utility : UtilityFunction C
  budgetSet : C.carrier → Prop
  budgetNonempty : ∀ p w, budgetSet (someElement p w)

structure UtilityMaximizationSolution {C : ConsumptionSet} (P : UtilityMaximizationProblem C) where
  optimalChoice : C.carrier
  budgetConstraint : P.budgetSet optimalChoice
  optimality : ∀ x : C.carrier, P.budgetSet x → P.utility.u x ≤ P.utility.u optimalChoice

def UtilityMaximizationClosed {C : ConsumptionSet} (P : UtilityMaximizationProblem C) : Prop :=
  Nonempty (UtilityMaximizationSolution P)

theorem utility_maximization_existence
    {C : ConsumptionSet} (P : UtilityMaximizationProblem C) (h : Continuous P.utility.u)
    (hcomp : ∀ p w, ∃ x : C.carrier, P.budgetSet x) (hcompact : IsCompact {x | P.budgetSet x}) :
    UtilityMaximizationClosed P := by
  sorry

end EconomicsInternationalCanonicalLaneLean
end HautevilleHouse