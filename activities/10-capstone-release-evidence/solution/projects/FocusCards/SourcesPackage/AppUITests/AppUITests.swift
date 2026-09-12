import XCTest

final class FocusCardsUITests: XCTestCase {
    func testLaunchesVisibleRoot() {
        let app = XCUIApplication()
        app.launchArguments = ["-ui-testing"]
        app.launch()
        XCTAssertTrue(app.navigationBars["FocusCards"].waitForExistence(timeout: 5))
    }
}
