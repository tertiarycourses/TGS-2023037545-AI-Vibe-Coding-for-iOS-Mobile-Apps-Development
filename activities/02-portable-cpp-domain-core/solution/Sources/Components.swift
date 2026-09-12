import SwiftUI

struct ProjectEvidence: Hashable {
    let statement: String
    let verifiedLocally: Bool
}

struct EvidenceBadge: View {
    let evidence: ProjectEvidence
    var body: some View {
        Label(evidence.statement, systemImage: evidence.verifiedLocally ? "checkmark.seal.fill" : "doc.text.magnifyingglass")
            .font(.footnote)
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 12))
            .accessibilityElement(children: .combine)
    }
}
