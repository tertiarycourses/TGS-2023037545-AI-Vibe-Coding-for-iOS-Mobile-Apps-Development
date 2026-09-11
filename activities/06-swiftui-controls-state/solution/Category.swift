enum Category: String, CaseIterable, Identifiable {
 case food, travel, other
 var id: Self { self }
 var label: String { rawValue.capitalized }
}
