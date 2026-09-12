import Observation
import SwiftUI

@MainActor @Observable final class AppModel {
    var index = 0
    var isRevealed = false

    private let cards = [("What is the bridge surface?", "Objective-C/C-compatible declarations."), ("Which state tool?", "@Observable on iOS 17+."), ("Which UI test tool?", "XCTest with XCUIAutomation.")]
    var prompt: String { cards[index].0 }
    var answer: String { cards[index].1 }
    func reveal() { isRevealed = true }
    func next() { index = (index + 1) % cards.count; isRevealed = false }
}

@main struct FocusCardsApp: App {
    @State private var model = AppModel()
    var body: some Scene { WindowGroup { ContentView(model: model) } }
}

struct ContentView: View {
    @Bindable var model: AppModel
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("A modern SwiftUI interpretation of the legacy flashcard concept.").foregroundStyle(.secondary)

                Text(model.prompt).font(.title2.bold()).accessibilityIdentifier("cardPrompt")
                if model.isRevealed { Text(model.answer).foregroundStyle(.secondary).accessibilityIdentifier("cardAnswer") }
                Button(model.isRevealed ? "Next card" : "Reveal answer") { model.isRevealed ? model.next() : model.reveal() }
                    .buttonStyle(.borderedProminent).accessibilityIdentifier("primaryAction")

                Spacer()
                EvidenceBadge(evidence: ProjectEvidence(statement: "Reveal and advance using an Observation model", verifiedLocally: true))
            }
            .padding(20)
            .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 24))
            .padding()
            .navigationTitle("FocusCards")
            .tint(.indigo)
        }
    }
}
