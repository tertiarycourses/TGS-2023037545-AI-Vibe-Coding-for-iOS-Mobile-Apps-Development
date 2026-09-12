import XCTest

final class Activity10ReleaseGateUITests: XCTestCase {
    func testLaunchesVisibleRoot() {
        let app = XCUIApplication()
        app.launchArguments = ["-ui-testing"]
        app.launch()
        XCTAssertTrue(app.navigationBars["Release Gate"].waitForExistence(timeout: 5))
    }
}
