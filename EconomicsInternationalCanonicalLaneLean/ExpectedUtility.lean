import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalCanonicalLaneLean

structure ExpectedUtilityPackage where
  riskPreferences : Type
  utilityFunction : Type
  vonNeumannMorgenstern : Prop
  certaintyEquivalent : Prop
  riskPremium : Prop

structure ExpectedUtilityEvidence (E : ExpectedUtilityPackage) where
  vonNeumannMorgensternClosed : E.vonNeumannMorgenstern
  certaintyEquivalentClosed : E.certaintyEquivalent
  riskPremiumClosed : E.riskPremium

def ExpectedUtilityClosed (E : ExpectedUtilityPackage) : Prop :=
  E.vonNeumannMorgenstern ∧ E.certaintyEquivalent ∧ E.riskPremium

theorem expected_utility_closed_from_evidence
    (E : ExpectedUtilityPackage) (Ev : ExpectedUtilityEvidence E) :
    ExpectedUtilityClosed E := by
  exact And.intro Ev.vonNeumannMorgensternClosed
    (And.intro Ev.certaintyEquivalentClosed Ev.riskPremiumClosed)

end EconomicsInternationalCanonicalLaneLean
end HautevilleHouse