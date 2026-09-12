import Testing
@testable import Activity02DomainCore

@MainActor struct Activity02DomainCoreTests {
    @Test func observableSliceProducesEvidence() {
        let model = AppModel()
        model.amountText = "1250"; model.addExpense(); #expect(model.remainingCents == 6_250)
    }
}
