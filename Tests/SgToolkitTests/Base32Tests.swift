//
//  Base32TestsTests.swift
//  SgToolkitTests
//
//  Created by Eugen Fedchenko on 6/15/18.
//

import XCTest
@testable import SgToolkit

class Base32Tests: XCTestCase {

    let samples = [("", ""),
                   ("f", "MY======"),
                   ("fo", "MZXQ===="),
                   ("foo", "MZXW6==="),
                   ("foob", "MZXW6YQ="),
                   ("fooba", "MZXW6YTB"),
                   ("foobar", "MZXW6YTBOI======"),
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
    
    func testAllValues() {
        // Generated with:
        // python -c 'import base64; print(base64.b32encode("".join([chr(x) for x in range(0, 256)]).encode()))'
        let allValues = """
                        AAAQEAYEAUDAOCAJBIFQYDIOB4IBCEQTCQKRMFYYDENBWHA5DYPSAIJCEMSCKJRHFAUSUKZMFUXC6MBRGIZTINJWG44DSOR
                        3HQ6T4P2AIFBEGRCFIZDUQSKKJNGE2TSPKBIVEU2UKVLFOWCZLJNVYXK6L5QGCYTDMRSWMZ3INFVGW3DNNZXXA4LSON2HK5T
                        XPB4XU634PV7H7QUAYKA4FAWCQPBIJQUFYKDMFB6CRDBITQUKYKF4FDGCRXBI5QUPYKIMFEOCSLBJHQUUYKK4FFWCS7BJRQU
                        ZYKNMFG6CTTBJ3QU6YKP4FIGCUHBKFQVDYKSMFJOCU3BKPQVIYKU4FKWCVPBKZQVNYKXMFL6CWDBLDQVSYKZ4FNGCWXBLNQV
                        XYK4MFOOCXLBLXQV4YK64FPWCX7BYBQ4BYOBMHA6DQTBYLQ4GYOD4HCGDRHBYVQ4LYOGMHDODR3BY7Q4QYOI4HEWDSPBZJQ4
                        VYOLMHF6DTDBZTQ42YON4HHGDTXBZ5Q47YOQMHIODULB2HQ5EYOS4HJWDU7B2RQ5JYOVMHK6DVTB23Q5OYOX4HMGDWHB3FQ5
                        TYO2MHNODW3B3PQ5YYO44HOWDXPB3ZQ55YO7MHPY=
                        """
        
        let data = Base32.decode(string: allValues)
        let encoded = Base32.encode(data: data ?? Data())
        
        XCTAssertEqual(allValues, encoded)
    }
    
    static var allTests = [
        ("testBase32Decoding", testBase32Decoding),
        ("testBase32Encoding", testBase32Encoding),
        ("testAllValues", testAllValues),
    ]
}
