import Observation
import SwiftUI

@MainActor @Observable final class AppModel {
    var completed = false
    func advance() { completed.toggle() }
}

@main struct Activity08EvidenceApp: App {
    @State private var model = AppModel()
    var body: some Scene { WindowGroup { ContentView(model: model) } }
}

struct ContentView: View {
    @Bindable var model: AppModel
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Connect domain, bridge, Swift Testing and XCTest evidence.").foregroundStyle(.secondary)

                Text("100%").font(.largeTitle.bold()).accessibilityIdentifier("metric")
                Label(model.completed ? "Verified" : "Ready to verify", systemImage: model.completed ? "checkmark.seal.fill" : "hammer.fill")
                    .foregroundStyle(model.completed ? .green : .orange).accessibilityIdentifier("status")
                Button(model.completed ? "Reset evidence" : "Record verification") { model.advance() }
                    .buttonStyle(.borderedProminent).accessibilityIdentifier("primaryAction")

                Spacer()
                EvidenceBadge(evidence: ProjectEvidence(statement: "REQ-001…REQ-005 traceable", verifiedLocally: true))
            }
            .padding(20)
            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 24))
            .padding()
            .navigationTitle("Evidence Board")
            .tint(.indigo)
        }
    }
}
