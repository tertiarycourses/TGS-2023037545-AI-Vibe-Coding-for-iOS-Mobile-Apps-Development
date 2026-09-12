import XCTest

final class HabitPulseUITests: XCTestCase {
    func testLaunchesVisibleRoot() {
        let app = XCUIApplication()
        app.launchArguments = ["-ui-testing"]
        app.launch()
        XCTAssertTrue(app.navigationBars["HabitPulse"].waitForExistence(timeout: 5))
    }
}
