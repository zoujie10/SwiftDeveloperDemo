//
//  EmailTester.swift
//  iOSDeveloperDemoTests
//
//  Created by Zoujie on 2021/12/4.
//  Copyright © 2021 Zoujie. All rights reserved.
//

import XCTest
@testable import iOSDeveloperDemo
//@testable import va
class EmailTester: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testEmail(){
        let emailUtil = EmailUtil()
//        let result = emailUtil.validateEmail(email: "qqeq@qewqew")
        let result = emailUtil.validateEmail(email: "8901110@qq.com")
        XCTAssert(result,"邮箱格式不正确")
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            for _ in 0...600{
//                let image = UIImage(named: "罗丹-思想者")//0.003
                let image = UIImage(contentsOfFile: "罗丹-思想者")//0.0182
                print(image?.size as Any)
            }
        }
    }

}
