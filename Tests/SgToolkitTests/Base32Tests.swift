//
//  Base32TestsTests.swift
//  SgToolkitTests
//
//  Created by Eugen Fedchenko on 6/15/18.
//

import XCTest
@testable import SgToolkit

class Base32Tests: XCTestCase {

    let samples: [(str: String, base32: String)] = [
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
        
        // Big samples
        ("Twas brillig, and the slithy toves", "KR3WC4ZAMJZGS3DMNFTSYIDBNZSCA5DIMUQHG3DJORUHSIDUN53GK4Y="),
        
        ("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
         "JRXXEZLNEBUXA43VNUQGI33MN5ZCA43JOQQGC3LFOQWCAY3PNZZWKY3UMV2HK4RAMFSGS4DJONRWS3THEBSWY2LUFQQHGZLEEBSG6IDFNF2XG3LPMQQHIZLNOBXXEIDJNZRWSZDJMR2W45BAOV2CA3DBMJXXEZJAMV2CAZDPNRXXEZJANVQWO3TBEBQWY2LROVQS4ICVOQQGK3TJNUQGCZBANVUW42LNEB3GK3TJMFWSYIDROVUXGIDON5ZXI4TVMQQGK6DFOJRWS5DBORUW63RAOVWGYYLNMNXSA3DBMJXXE2LTEBXGS43JEB2XIIDBNRUXC5LJOAQGK6BAMVQSAY3PNVWW6ZDPEBRW63TTMVYXKYLUFYQEI5LJOMQGC5LUMUQGS4TVOJSSAZDPNRXXEIDJNYQHEZLQOJSWQZLOMRSXE2LUEBUW4IDWN5WHK4DUMF2GKIDWMVWGS5BAMVZXGZJAMNUWY3DVNUQGI33MN5ZGKIDFOUQGM5LHNFQXIIDOOVWGYYJAOBQXE2LBOR2XELRAIV4GGZLQORSXK4RAONUW45BAN5RWGYLFMNQXIIDDOVYGSZDBORQXIIDON5XCA4DSN5UWIZLOOQWCA43VNZ2CA2LOEBRXK3DQMEQHC5LJEBXWMZTJMNUWCIDEMVZWK4TVNZ2CA3LPNRWGS5BAMFXGS3JANFSCAZLTOQQGYYLCN5ZHK3JO")
    ]
    
    func testEncoding() {
        samples.forEach {
            let data = $0.str.data(using: .utf8)!
            XCTAssertEqual(Base32.encode(data: data), $0.base32)
        }
    }
    
    func testDecoding() {
        samples.forEach {
            let decoded = Base32.decode(string: $0.base32)
            XCTAssertNotNil(decoded)
            XCTAssertEqual($0.str.data(using: .utf8)!, decoded)
        }
    }
    
    func testStringDecoding() {
        samples.forEach { (str, base32) in
            XCTAssertEqual(str, base32.base32DecodedString())
        }
    }
    
    func testStringEncoding() {
        samples.forEach { (str, base32) in
            XCTAssertEqual(str.base32Encoded(), base32)
        }
    }
    
    static var allTests = [
        ("testEncoding", testEncoding),
        ("testDecoding", testDecoding),
        ("tesStringDecoding", testStringDecoding),
        ("testStringEncoding", testStringEncoding),
    ]
}
