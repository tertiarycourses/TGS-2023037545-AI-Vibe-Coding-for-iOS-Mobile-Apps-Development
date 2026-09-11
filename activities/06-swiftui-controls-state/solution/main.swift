let bridge = FakeBudgetBridge()
bridge.result = BridgeDecision(accepted: true, remainingCents: 6_250)
let model = BudgetViewModel(bridge: bridge)
model.amountText = "12.50"
model.save()
precondition(bridge.lastDraftCents == 1_250)
precondition(model.remainingCents == 6_250)
precondition(model.amountText.isEmpty)
model.amountText = "0"
model.save()
precondition(model.message != nil)
print("BudgetViewModel verification passed")
