struct BridgeDecision { let accepted: Bool; let remainingCents: Int64 }
protocol BudgetEvaluating {
 func evaluate(limitCents: Int64, spentCents: Int64, draftCents: Int64) throws -> BridgeDecision
}
