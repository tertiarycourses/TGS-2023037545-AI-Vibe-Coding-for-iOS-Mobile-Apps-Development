import XCTest

final class Activity08EvidenceUITests: XCTestCase {
    func testLaunchesVisibleRoot() {
        let app = XCUIApplication()
        app.launchArguments = ["-ui-testing"]
        app.launch()
        XCTAssertTrue(app.navigationBars["Evidence Board"].waitForExistence(timeout: 5))
    }
}
