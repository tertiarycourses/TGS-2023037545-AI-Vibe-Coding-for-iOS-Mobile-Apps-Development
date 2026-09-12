import Testing
@testable import Activity04QualityGate

@MainActor struct Activity04QualityGateTests {
    @Test func observableSliceProducesEvidence() {
        let model = AppModel()
        model.advance(); #expect(model.completed)
    }
}
