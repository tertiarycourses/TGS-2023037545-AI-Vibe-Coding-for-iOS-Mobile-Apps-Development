import Testing
@testable import FocusCards

@MainActor struct FocusCardsTests {
    @Test func observableSliceProducesEvidence() {
        let model = AppModel()
        model.reveal(); #expect(model.isRevealed); model.next(); #expect(model.index == 1)
    }
}
