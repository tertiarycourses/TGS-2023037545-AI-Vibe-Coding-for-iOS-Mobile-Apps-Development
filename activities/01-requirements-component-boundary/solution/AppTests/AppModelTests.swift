import Testing
@testable import Activity01ScopeBoard

@MainActor struct Activity01ScopeBoardTests {
    @Test func observableSliceProducesEvidence() {
        let model = AppModel()
        model.advance(); #expect(model.completed)
    }
}
