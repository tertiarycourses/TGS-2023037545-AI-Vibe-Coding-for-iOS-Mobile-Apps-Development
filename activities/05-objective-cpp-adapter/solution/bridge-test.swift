func testRoundTripPreservesExactCents() throws {
  let result = try XCTUnwrap(BudgetBridge().evaluateLimit(10_000, spent: 2_500, draft: 1_250))
  XCTAssertEqual(result.remainingCents, 6_250)
}
