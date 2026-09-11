import Foundation
import Observation

enum MoneyParser {
 static func cents(_ text: String) -> Int64? {
  let value = text.trimmingCharacters(in: .whitespacesAndNewlines)
  let parts = value.split(separator: ".", omittingEmptySubsequences: false)
  guard (1...2).contains(parts.count), !parts[0].isEmpty, parts[0].allSatisfy({ $0.isNumber }) else { return nil }
  let fraction = parts.count == 2 ? String(parts[1]) : ""
  guard fraction.count <= 2, fraction.allSatisfy({ $0.isNumber }), let major = Int64(parts[0]) else { return nil }
  let padded = fraction.padding(toLength: 2, withPad: "0", startingAt: 0)
  guard let minor = Int64(padded), major <= (Int64.max-minor)/100 else { return nil }
  let total = major*100+minor
  return total > 0 ? total : nil
 }
}

@Observable final class BudgetViewModel {
 var amountText = ""
 var category = Category.food
 private(set) var message: String?
 private(set) var remainingCents: Int64
 private var spentCents: Int64
 private let limitCents: Int64
 private let bridge: any BudgetEvaluating
 init(limitCents: Int64 = 10_000, spentCents: Int64 = 2_500, bridge: any BudgetEvaluating) {
  self.limitCents=limitCents; self.spentCents=spentCents; self.remainingCents=limitCents-spentCents; self.bridge=bridge
 }
 func save() {
  guard let draft=MoneyParser.cents(amountText) else { message="Enter a positive amount with at most two decimal places."; return }
  do {
   let result=try bridge.evaluate(limitCents: limitCents, spentCents: spentCents, draftCents: draft)
   guard result.accepted else { message="Expense exceeds the remaining budget."; return }
   remainingCents=result.remainingCents; spentCents=limitCents-result.remainingCents; amountText=""; message=nil
  } catch { message="The expense could not be saved. Correct the issue and retry." }
 }
}
