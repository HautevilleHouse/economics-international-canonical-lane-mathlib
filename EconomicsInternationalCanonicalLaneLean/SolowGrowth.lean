import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalCanonicalLaneLean

structure SolowGrowthPackage where
  capitalStock : Type
  laborForce : Type
  productionFunction : Type
  steadyStateExists : Prop
  convergenceProperties : Prop
  savingsRateOptimal : Prop

structure SolowGrowthEvidence (S : SolowGrowthPackage) where
  steadyStateExistsClosed : S.steadyStateExists
  convergencePropertiesClosed : S.convergenceProperties
  savingsRateOptimalClosed : S.savingsRateOptimal

def SolowGrowthClosed (S : SolowGrowthPackage) : Prop :=
  S.steadyStateExists ∧ S.convergenceProperties ∧ S.savingsRateOptimal

theorem solow_growth_closed_from_evidence
    (S : SolowGrowthPackage) (E : SolowGrowthEvidence S) :
    SolowGrowthClosed S := by
  exact And.intro E.steadyStateExistsClosed
    (And.intro E.convergencePropertiesClosed E.savingsRateOptimalClosed)

end EconomicsInternationalCanonicalLaneLean
end HautevilleHouse