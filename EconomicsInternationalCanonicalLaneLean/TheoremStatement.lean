import EconomicsInternationalCanonicalLaneLean.ReviewerBridge

/-!
# Theorem Statement Layer
-/

namespace HautevilleHouse
namespace EconomicsInternationalCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  constrainedStatement : String
  certificateLane : String
  carriedRemainder : String
deriving Repr, DecidableEq

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := "economics-international-canonical-lane",
  theoremName := "General Equilibrium and Asset Pricing",
  theoremObject := "Arrow-Debreu equilibrium existence and welfare theorems",
  classicalBoundary := "Unrestricted classical closure remains carried",
  constrainedStatement := "Admissible-class closure for Walrasian equilibrium and asset pricing",
  certificateLane := "economics_international_constrained",
  carriedRemainder := "Classical source boundary carried by theoremBoundaryOpen"
}

theorem theorem_statement_source_key_checked :
    sourceTheoremStatement.sourceKey = "economics-international-canonical-lane" := by
  rfl

theorem theorem_statement_certificate_lane_checked :
    sourceTheoremStatement.certificateLane = "economics_international_constrained" := by
  rfl

end EconomicsInternationalCanonicalLaneLean
end HautevilleHouse
