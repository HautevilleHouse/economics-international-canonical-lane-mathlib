import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalCanonicalLaneLean

structure GameTheoryPackage where
  players : Type
  strategies : Type
  payoffs : Type
  nashEquilibriumExists : Prop
  paretoOptimality : Prop
  dominantStrategy : Prop

structure GameTheoryEvidence (G : GameTheoryPackage) where
  nashEquilibriumExistsClosed : G.nashEquilibriumExists
  paretoOptimalityClosed : G.paretoOptimality
  dominantStrategyClosed : G.dominantStrategy

def GameTheoryClosed (G : GameTheoryPackage) : Prop :=
  G.nashEquilibriumExists ∧ G.paretoOptimality ∧ G.dominantStrategy

theorem game_theory_closed_from_evidence
    (G : GameTheoryPackage) (E : GameTheoryEvidence G) :
    GameTheoryClosed G := by
  exact And.intro E.nashEquilibriumExistsClosed
    (And.intro E.paretoOptimalityClosed E.dominantStrategyClosed)

end EconomicsInternationalCanonicalLaneLean
end HautevilleHouse