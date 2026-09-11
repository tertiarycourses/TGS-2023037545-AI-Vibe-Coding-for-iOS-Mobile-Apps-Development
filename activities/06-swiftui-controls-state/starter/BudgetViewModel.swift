import Observation
@Observable final class BudgetViewModel {
  var amountText = ""
  var category = Category.food
  private(set) var message: String?
  func save() { /* TODO: parse, call bridge, map result */ }
}
