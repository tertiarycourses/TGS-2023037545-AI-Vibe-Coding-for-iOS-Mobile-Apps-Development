import Observation
import SwiftUI

@MainActor @Observable final class AppModel {
    var amountText = "1250"
    var limitCents: Int64 = 10_000
    var spentCents: Int64 = 2_500
    var status = "Bridge ready"

    private let bridge = BudgetBridge()
    var remainingCents: Int64 { max(0, limitCents - spentCents) }
    func addExpense() {
        guard let cents = Int64(amountText) else { status = "Enter an integer number of cents."; return }
        let code = bridge.errorCode(forLimit: limitCents, spent: spentCents, draft: cents)
        guard code == 0 else { status = code == 1002 ? "Expense is over budget." : "Enter a positive amount."; return }
        let remaining = bridge.remaining(forLimit: limitCents, spent: spentCents, draft: cents)
        spentCents = limitCents - remaining; amountText = ""; status = "Expense saved through the C++ policy."
    }
}

@main struct BudgetBuddyApp: App {
    @State private var model = AppModel()
    var body: some Scene { WindowGroup { ContentView(model: model) } }
}

struct ContentView: View {
    @Bindable var model: AppModel
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("Protect exact-cent spending rules across the C++ bridge.").foregroundStyle(.secondary)

                Text("Remaining: $\(Double(model.remainingCents) / 100, specifier: "%.2f")").font(.largeTitle.bold()).accessibilityIdentifier("remainingAmount")
                TextField("Amount in cents", text: $model.amountText).keyboardType(.numberPad).textFieldStyle(.roundedBorder).accessibilityIdentifier("amount")
                Button("Evaluate with C++") { model.addExpense() }.buttonStyle(.borderedProminent).accessibilityIdentifier("saveExpense")
                Text(model.status).foregroundStyle(.secondary).accessibilityIdentifier("validationMessage")

                Spacer()
                EvidenceBadge(evidence: ProjectEvidence(statement: "Domain, bridge, Observation and UI evidence", verifiedLocally: true))
            }
            .padding(20)
            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 24))
            .padding()
            .navigationTitle("BudgetBuddy")
            .tint(.indigo)
        }
    }
}
