//
//  iOSDeveloperDemoUITests.swift
//  iOSDeveloperDemoUITests
//
//  Created by Zoujie on 2021/12/4.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import XCTest

class iOSDeveloperDemoUITests: XCTestCase {

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
        
        let app = XCUIApplication()
        app.launch()
        let tablesQuery = app.tables
        let staticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["9.动画声音视频"]/*[[".cells.staticTexts[\"9.动画声音视频\"]",".staticTexts[\"9.动画声音视频\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        staticText.swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["16.数据解析"]/*[[".cells.staticTexts[\"16.数据解析\"]",".staticTexts[\"16.数据解析\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["12.MapKit"]/*[[".cells.staticTexts[\"12.MapKit\"]",".staticTexts[\"12.MapKit\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeDown()
        staticText.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["牛奶"]/*[[".cells.staticTexts[\"牛奶\"]",".staticTexts[\"牛奶\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["坚果谷物"]/*[[".cells.staticTexts[\"坚果谷物\"]",".staticTexts[\"坚果谷物\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["ListVC"].buttons["ww navs main back bar btn img "].tap()
    
//        let app = XCUIApplication()
//                app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
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
