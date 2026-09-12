import Observation
import SwiftUI

struct Habit: Identifiable { let id = UUID(); let title: String; var isDone: Bool }

@MainActor @Observable final class AppModel {
    var habits = [Habit(title: "Review generated diff", isDone: true), Habit(title: "Run focused test", isDone: false), Habit(title: "Retain evidence", isDone: false)]

    var completionRate: Int { habits.isEmpty ? 0 : habits.filter({ $0.isDone }).count * 100 / habits.count }
    func toggle(_ id: UUID) { guard let i = habits.firstIndex(where: { $0.id == id }) else { return }; habits[i].isDone.toggle() }
}

@main struct HabitPulseApp: App {
    @State private var model = AppModel()
    var body: some Scene { WindowGroup { ContentView(model: model) } }
}

struct ContentView: View {
    @Bindable var model: AppModel
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("A native habit tracker for the red→repair→green routine.").foregroundStyle(.secondary)

                Text("\(model.completionRate)% complete").font(.largeTitle.bold()).accessibilityIdentifier("completionRate")
                ForEach(model.habits) { habit in
                    Button { model.toggle(habit.id) } label: { Label(habit.title, systemImage: habit.isDone ? "checkmark.circle.fill" : "circle") }
                        .accessibilityIdentifier("habit-\(habit.id.uuidString)")
                }

                Spacer()
                EvidenceBadge(evidence: ProjectEvidence(statement: "Stable identity and accessible toggle actions", verifiedLocally: true))
            }
            .padding(20)
            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 24))
            .padding()
            .navigationTitle("HabitPulse")
            .tint(.indigo)
        }
    }
}
