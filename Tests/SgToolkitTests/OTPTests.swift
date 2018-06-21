//
//  OTPTests.swift
//  SgToolkitTests
//
//  Created by Eugen Fedchenko on 6/21/18.
//

import XCTest
@testable import SgToolkit

class OTPTests: XCTestCase {
    
    func testOTPProvider() {
        //"12345678901234567890" 
        let otp = OTPProvider(secret: "GEZDGNBVGY3TQOJQGEZDGNBVGY3TQOJQ", digits: 6)
        
        XCTAssertEqual("755224", otp.generate(counter: 0))
        XCTAssertEqual("287082", otp.generate(counter: 1))
        XCTAssertEqual("359152", otp.generate(counter: 2))
        XCTAssertEqual("969429", otp.generate(counter: 3))
        XCTAssertEqual("338314", otp.generate(counter: 4))
        XCTAssertEqual("254676", otp.generate(counter: 5))
        XCTAssertEqual("287922", otp.generate(counter: 6))
        XCTAssertEqual("162583", otp.generate(counter: 7))
        XCTAssertEqual("399871", otp.generate(counter: 8))
        XCTAssertEqual("520489", otp.generate(counter: 9))
    }
    
    static var allTests = [
        ("testOTPProvider", testOTPProvider),
    ]
}
