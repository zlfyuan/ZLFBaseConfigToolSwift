//
//  ZLF_Example.swift
//  ZLFBaseConfigToolSwift
//
//  Created by zluof on 2020/12/1.
//  Copyright © 2020 zluof. All rights reserved.
//

import XCTest
@testable import ZLFBaseConfigToolSwift
//@testable import ZLFBaseConfigToolSwift_Example
class ZLF_Example: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let phone = "18812340000"
        XCTAssert(phone.bc.available(type: .phone()) == true)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
