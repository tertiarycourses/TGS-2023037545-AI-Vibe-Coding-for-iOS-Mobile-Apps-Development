import Testing
@testable import Activity03RepairLoop

@MainActor struct Activity03RepairLoopTests {
    @Test func observableSliceProducesEvidence() {
        let model = AppModel()
        model.advance(); #expect(model.completed)
    }
}
