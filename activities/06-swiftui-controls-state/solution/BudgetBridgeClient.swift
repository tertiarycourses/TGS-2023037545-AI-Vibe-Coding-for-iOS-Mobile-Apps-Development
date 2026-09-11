struct BridgeDecision { let accepted: Bool; let remainingCents: Int64 }
protocol BudgetEvaluating {
 func evaluate(limitCents: Int64, spentCents: Int64, draftCents: Int64) throws -> BridgeDecision
}
final class FakeBudgetBridge: BudgetEvaluating {
 var result = BridgeDecision(accepted: true, remainingCents: 0)
 var error: Error?
 private(set) var lastDraftCents: Int64?
 func evaluate(limitCents: Int64, spentCents: Int64, draftCents: Int64) throws -> BridgeDecision {
  lastDraftCents = draftCents
  if let error { throw error }
  return result
 }
}
