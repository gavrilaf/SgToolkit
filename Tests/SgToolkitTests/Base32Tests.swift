//
//  Base32TestsTests.swift
//  SgToolkitTests
//
//  Created by Eugen Fedchenko on 6/15/18.
//

import XCTest
@testable import SgToolkit

class Base32Tests: XCTestCase {

    let samples = [
        // RFC 4648 examples
        ("", ""),
        ("f", "MY======"),
        ("fo", "MZXQ===="),
        ("foo", "MZXW6==="),
        ("foob", "MZXW6YQ="),
        ("fooba", "MZXW6YTB"),
        ("foobar", "MZXW6YTBOI======"),
        
        // Wikipedia examples
        ("sure.", "ON2XEZJO"),
        ("sure", "ON2XEZI="),
        ("sur", "ON2XE==="),
        ("su", "ON2Q===="),
        ("leasure.", "NRSWC43VOJSS4==="),
        ("easure.", "MVQXG5LSMUXA===="),
        ("asure.", "MFZXK4TFFY======"),
        ("sure.", "ON2XEZJO"),
    ]
    
    
    func testBase32Decoding() {
        samples.forEach { (str, base32) in
            XCTAssertEqual(str, base32.base32DecodedString())
        }
    }
    
    func testBase32Encoding() {
        samples.forEach { (str, base32) in
            XCTAssertEqual(str.base32Encoded(), base32)
        }
    }
    
    
    
    static var allTests = [
        ("testBase32Decoding", testBase32Decoding),
        ("testBase32Encoding", testBase32Encoding),
    ]
}
