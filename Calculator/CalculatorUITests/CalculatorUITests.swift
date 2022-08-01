//
//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by Byoung_wook on 2022/08/01.
//

import XCTest

class CalculatorUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        
        app.launch()
        app/*@START_MENU_TOKEN@*/.staticTexts["7"]/*[[".buttons[\"7\"].staticTexts[\"7\"]",".staticTexts[\"7\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.staticTexts["8"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["9"]/*[[".buttons[\"9\"].staticTexts[\"9\"]",".staticTexts[\"9\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["+"]/*[[".buttons[\"+\"].staticTexts[\"+\"]",".staticTexts[\"+\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["3"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["2"]/*[[".buttons[\"2\"].staticTexts[\"2\"]",".staticTexts[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["1"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["="]/*[[".buttons[\"=\"].staticTexts[\"=\"]",".staticTexts[\"=\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.staticTexts["1110"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["AC"]/*[[".buttons[\"AC\"].staticTexts[\"AC\"]",".staticTexts[\"AC\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        

    }
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
