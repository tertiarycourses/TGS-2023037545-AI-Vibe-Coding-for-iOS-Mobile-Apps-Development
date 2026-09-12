import Observation
import SwiftUI

@MainActor @Observable final class AppModel {
    var completed = false
    func advance() { completed.toggle() }
}

@main struct Activity07RecoveryApp: App {
    @State private var model = AppModel()
    var body: some Scene { WindowGroup { ContentView(model: model) } }
}

struct ContentView: View {
    @Bindable var model: AppModel
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Show versioned persistence and an explicit retry state.").foregroundStyle(.secondary)

                Text("Schema v2").font(.largeTitle.bold()).accessibilityIdentifier("metric")
                Label(model.completed ? "Verified" : "Ready to verify", systemImage: model.completed ? "checkmark.seal.fill" : "hammer.fill")
                    .foregroundStyle(model.completed ? .green : .orange).accessibilityIdentifier("status")
                Button(model.completed ? "Reset evidence" : "Record verification") { model.advance() }
                    .buttonStyle(.borderedProminent).accessibilityIdentifier("primaryAction")

                Spacer()
                EvidenceBadge(evidence: ProjectEvidence(statement: "Last known-good snapshot preserved", verifiedLocally: true))
            }
            .padding(20)
            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 24))
            .padding()
            .navigationTitle("Recovery")
            .tint(.indigo)
        }
    }
}
