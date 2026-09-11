import SwiftUI
struct BudgetScreen: View {
 @Bindable var model: BudgetViewModel
 var body: some View { Form {
  TextField("Amount", text: $model.amountText).keyboardType(.decimalPad).accessibilityIdentifier("amount")
  Picker("Category", selection: $model.category) { ForEach(Category.allCases) { Text($0.label).tag($0) } }
  Button("Save expense") { model.save() }.accessibilityIdentifier("saveExpense")
  if let message=model.message { Text(message).accessibilityIdentifier("validationMessage") }
 } }
}
