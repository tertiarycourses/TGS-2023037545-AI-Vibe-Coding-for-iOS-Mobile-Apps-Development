import Testing
@testable import BudgetBuddy

@MainActor struct BudgetBuddyTests {
    @Test func observableSliceProducesEvidence() {
        let model = AppModel()
        model.amountText = "1250"; model.addExpense(); #expect(model.remainingCents == 6_250); #expect(model.status.contains("C++")); model.amountText = "8000"; model.addExpense(); #expect(model.status.contains("over budget"))
    }
}
