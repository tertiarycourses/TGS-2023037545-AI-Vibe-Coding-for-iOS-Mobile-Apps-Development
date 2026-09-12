import Observation
import SwiftUI

@MainActor @Observable final class AppModel {
    var remainingCents: Int64 = 7_500
    var status = "Bridge ready"

    private let bridge = BudgetBridge()
    func runBridge() {
        remainingCents = bridge.remaining(forLimit: 10_000, spent: 2_500, draft: 1_250)
        let code = bridge.errorCode(forLimit: 10_000, spent: 9_000, draft: 2_000)
        status = remainingCents == 6_250 && code == 1002 ? "Exact cents and stable over-budget error verified." : "Bridge evidence failed."
    }
}

@main struct Activity05BridgeApp: App {
    @State private var model = AppModel()
    var body: some Scene { WindowGroup { ContentView(model: model) } }
}

struct ContentView: View {
    @Bindable var model: AppModel
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Compile the Objective-C++ seam while keeping C++ out of SwiftUI.").foregroundStyle(.secondary)

                Text("\(model.remainingCents) cents").font(.largeTitle.bold()).accessibilityIdentifier("metric")
                Text(model.status).foregroundStyle(.secondary).accessibilityIdentifier("validationMessage")
                Button("Run bridge contract") { model.runBridge() }.buttonStyle(.borderedProminent).accessibilityIdentifier("primaryAction")

                Spacer()
                EvidenceBadge(evidence: ProjectEvidence(statement: "Swift → Objective-C → Objective-C++ → C++", verifiedLocally: true))
            }
            .padding(20)
            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 24))
            .padding()
            .navigationTitle("Bridge Boundary")
            .tint(.indigo)
        }
    }
}
