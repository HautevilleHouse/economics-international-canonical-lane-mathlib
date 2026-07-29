import EconomicsInternationalCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace EconomicsInternationalCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure EconomicsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure EconomicsAdmittedObject where
  space : EconomicsSpace
  competitiveEquilibrium : Prop
  paretoOptimal : Prop
  utilityMaximizing : Prop
  marketClearing : Prop
  conclusion : competitiveEquilibrium ∧ paretoOptimal ∧ utilityMaximizing ∧ marketClearing

structure EconomicsEndgameState where
  object : EconomicsAdmittedObject

def EconomicsWitnessClosed (O : EconomicsAdmittedObject) : Prop :=
  O.conclusion

end EconomicsInternationalCanonicalLaneLean
end HautevilleHouse
