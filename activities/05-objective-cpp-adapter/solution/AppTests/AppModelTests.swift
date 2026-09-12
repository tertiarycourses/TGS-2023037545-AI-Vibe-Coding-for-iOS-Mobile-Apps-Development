import Testing
@testable import Activity05Bridge

@MainActor struct Activity05BridgeTests {
    @Test func observableSliceProducesEvidence() {
        let model = AppModel()
        model.runBridge(); #expect(model.remainingCents == 6_250); #expect(model.status.contains("stable over-budget")); let bridge = BudgetBridge(); #expect(bridge.errorCode(forLimit: 10_000, spent: 2_500, draft: 0) == 1001); #expect(bridge.errorCode(forLimit: 10_000, spent: 9_000, draft: 2_000) == 1002)
    }
}
