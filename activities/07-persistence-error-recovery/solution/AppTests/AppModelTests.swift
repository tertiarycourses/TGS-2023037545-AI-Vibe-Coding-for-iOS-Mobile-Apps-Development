import Testing
@testable import Activity07Recovery

@MainActor struct Activity07RecoveryTests {
    @Test func observableSliceProducesEvidence() {
        let model = AppModel()
        model.advance(); #expect(model.completed)
    }
}
