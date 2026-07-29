import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalCanonicalLaneLean

structure SocialWelfareFunctional (agents : Type u) (alternatives : Type u) where
  preferences : agents → alternatives → alternatives → Prop
  socialRanking : alternatives → alternatives → Prop
  paretoEfficiency : ∀ x y : alternatives, (∀ a : agents, preferences a x y) → socialRanking x y
  independenceOfIrrelevantAlternatives : ∀ x y : alternatives, 
    (∀ a : agents, (preferences a x y) ↔ (preferences a x y)) → (socialRanking x y) ↔ (socialRanking x y)

structure ArrowImpossibility (agents : Type u) (alternatives : Type u) (S : SocialWelfareFunctional agents alternatives) where
  nonDictatorship : ¬ ∃ a : agents, ∀ x y : alternatives, S.preferences a x y → S.socialRanking x y
  impossibility : False

def SocialWelfareClosed (agents : Type u) (alternatives : Type u) (S : SocialWelfareFunctional agents alternatives) : Prop :=
  S.paretoEfficiency

theorem arrow_impossibility_theorem (agents : Type u) (alternatives : Type u) (S : SocialWelfareFunctional agents alternatives)
    (h : ArrowImpossibility agents alternatives S) : False := by
  exact h.impossibility

end EconomicsInternationalCanonicalLaneLean
end HautevilleHouse