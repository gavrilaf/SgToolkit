//
//  StringFoundationTests.swift
//  SgToolkitTests
//
//  Created by Eugen Fedchenko on 6/21/18.
//

import XCTest
@testable import SgToolkit

class StringFoundationTests: XCTestCase {
    
    func testPadded() {
        XCTAssertEqual("BBAAA", "AAA".padded(with: "B", toLength: 5))
        XCTAssertEqual("BBB", "".padded(with: "B", toLength: 3))
        XCTAssertEqual("BBB", "BBB".padded(with: "B", toLength: 3))
        XCTAssertEqual("0000BBB", "BBB".padded(with: "0", toLength: 7))
        
        XCTAssertEqual("AAABB", "AAA".padded(with: "B", toLength: 5, left: false))
        XCTAssertEqual("BBB", "".padded(with: "B", toLength: 3, left: false))
        XCTAssertEqual("BBB", "BBB".padded(with: "B", toLength: 3, left: false))
        XCTAssertEqual("BBB0000", "BBB".padded(with: "0", toLength: 7, left: false))
    }
    
    static var allTests = [
        ("testPadded", testPadded),
    ]
}
