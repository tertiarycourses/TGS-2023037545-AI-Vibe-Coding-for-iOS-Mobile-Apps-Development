import Testing
@testable import Activity06BudgetUI

@MainActor struct Activity06BudgetUITests {
    @Test func observableSliceProducesEvidence() {
        let model = AppModel()
        model.amountText = "1250"; model.addExpense(); #expect(model.remainingCents == 6_250)
    }
}
