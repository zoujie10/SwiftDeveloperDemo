//
//  iOSDeveloperDemoTests.swift
//  iOSDeveloperDemoTests
//
//  Created by Zoujie on 2018/5/7.
//  Copyright © 2018年 Zoujie. All rights reserved.
//
import UIKit
import XCTest
@testable import iOSDeveloperDemo

class iOSDeveloperDemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
		//在此添加测试用例初始代码。此方法在每个测试用例执行前执行 可以做些初始化操作
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
		//在此添加释放测试用例资源代码。此方法在每个测试用例执行后执行。释放资源的方法，每个测试用例执行后执行。
        super.tearDown()
    }
    
	func testRealmDataWrite(){
//		XCTAssertEqual(<#T##expression1: Equatable##Equatable#>, <#T##expression2: Equatable##Equatable#>)
//		XCTAssertNil
//		XCTAssertNotNil
//		XCTAssertTrue
//		XCTAssertFalse
//		XCTAssertNoThrow
	}
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results
        //eg：
        let peopelID = "130140102040104011"
        let count = peopelID.count
//        XCTAssert(count == 5 || count == 10,"错误的号码")
        XCTAssert(count == 18,"正确的号码")

    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
			//性能测试代码
        }
    }
    
}
