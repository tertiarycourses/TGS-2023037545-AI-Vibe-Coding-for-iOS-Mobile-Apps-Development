import XCTest

final class BudgetBuddyUITests: XCTestCase {
    func testLaunchesVisibleRoot() {
        let app = XCUIApplication()
        app.launchArguments = ["-ui-testing"]
        app.launch()
        XCTAssertTrue(app.navigationBars["BudgetBuddy"].waitForExistence(timeout: 5))
    }
}
