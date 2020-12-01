import XCTest
import ZLFBaseConfigToolSwift

import Foundation
//@testable import ZLFBaseConfigToolSwift_Example
@testable import ZLFBaseConfigToolSwift
class StringTest: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    
    func testEx() {
        let e = ZLFDevice.currentDevice.devicePrint(length: 10)
        XCTAssert(e == false)
    }
}


class Tests: XCTestCase{
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
//        XCTAssert(true, "Pass")
//        let date = Date()
//        XCTAssert(date.currentDay == "1")
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
