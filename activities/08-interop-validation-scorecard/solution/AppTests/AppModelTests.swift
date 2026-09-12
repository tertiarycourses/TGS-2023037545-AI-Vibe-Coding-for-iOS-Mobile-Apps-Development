import Testing
@testable import Activity08Evidence

@MainActor struct Activity08EvidenceTests {
    @Test func observableSliceProducesEvidence() {
        let model = AppModel()
        model.advance(); #expect(model.completed)
    }
}
