import Testing
@testable import Activity09Architecture

@MainActor struct Activity09ArchitectureTests {
    @Test func observableSliceProducesEvidence() {
        let model = AppModel()
        model.advance(); #expect(model.completed)
    }
}
