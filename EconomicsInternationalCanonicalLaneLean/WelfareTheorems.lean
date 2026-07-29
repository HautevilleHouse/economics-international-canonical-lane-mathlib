import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsInternationalCanonicalLaneLean

structure WelfareTheoremsPackage where
  economy : ArrowDebreuEquilibrium
  paretoOptimalAllocation : Prop
  firstWelfareTheorem : Prop
  secondWelfareTheorem : Prop
  lumpSumTransfers : Prop

structure WelfareEvidence (W : WelfareTheoremsPackage) where
  paretoOptimalAllocationClosed : W.paretoOptimalAllocation
  firstWelfareTheoremClosed : W.firstWelfareTheorem
  secondWelfareTheoremClosed : W.secondWelfareTheorem
  lumpSumTransfersClosed : W.lumpSumTransfers

def WelfareTheoremsClosed (W : WelfareTheoremsPackage) : Prop :=
  W.paretoOptimalAllocation ∧ W.firstWelfareTheorem ∧
  W.secondWelfareTheorem ∧ W.lumpSumTransfers

theorem welfare_theorems_closed_from_evidence (W : WelfareTheoremsPackage)
    (Ev : WelfareEvidence W) : WelfareTheoremsClosed W := by
  exact And.intro Ev.paretoOptimalAllocationClosed
    (And.intro Ev.firstWelfareTheoremClosed
      (And.intro Ev.secondWelfareTheoremClosed Ev.lumpSumTransfersClosed))

end EconomicsInternationalCanonicalLaneLean
end HautevilleHouse