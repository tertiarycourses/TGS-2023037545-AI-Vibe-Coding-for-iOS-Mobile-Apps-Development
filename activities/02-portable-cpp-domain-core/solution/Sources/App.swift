import Observation
import SwiftUI

@MainActor @Observable final class AppModel {
    var amountText = "1250"
    var limitCents: Int64 = 10_000
    var spentCents: Int64 = 2_500
    var status = "Ready"

    var remainingCents: Int64 { max(0, limitCents - spentCents) }
    func addExpense() { guard let cents = Int64(amountText), cents > 0, cents <= remainingCents else { status = "Enter valid cents within the remaining budget."; return }; spentCents += cents; amountText = ""; status = "Expense saved." }
}

@main struct Activity02DomainCoreApp: App {
    @State private var model = AppModel()
    var body: some Scene { WindowGroup { ContentView(model: model) } }
}

struct ContentView: View {
    @Bindable var model: AppModel
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Exercise exact-cent budget decisions behind a native iOS shell.").foregroundStyle(.secondary)

                Text("Remaining: $\(Double(model.remainingCents) / 100, specifier: "%.2f")").font(.largeTitle.bold()).accessibilityIdentifier("remainingAmount")
                TextField("Amount in cents", text: $model.amountText).keyboardType(.numberPad).textFieldStyle(.roundedBorder).accessibilityIdentifier("amount")
                Button("Save expense") { model.addExpense() }.buttonStyle(.borderedProminent).accessibilityIdentifier("saveExpense")
                Text(model.status).foregroundStyle(.secondary).accessibilityIdentifier("validationMessage")

                Spacer()
                EvidenceBadge(evidence: ProjectEvidence(statement: "Portable C++ tests are the source of truth", verifiedLocally: true))
            }
            .padding(20)
            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 24))
            .padding()
            .navigationTitle("Domain Core")
            .tint(.indigo)
        }
    }
}
