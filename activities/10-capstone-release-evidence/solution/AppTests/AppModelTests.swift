import Testing
@testable import Activity10ReleaseGate

@MainActor struct Activity10ReleaseGateTests {
    @Test func observableSliceProducesEvidence() {
        let model = AppModel()
        model.advance(); #expect(model.completed)
    }
}
