import Testing
@testable import HabitPulse

@MainActor struct HabitPulseTests {
    @Test func observableSliceProducesEvidence() {
        let model = AppModel()
        let id = model.habits[1].id; model.toggle(id); #expect(model.completionRate == 66)
    }
}
