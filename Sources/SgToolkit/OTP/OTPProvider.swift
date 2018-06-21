//
//  OTPProvider.swift
//  SgToolkit
//
//  Created by Eugen Fedchenko on 6/21/18.
//

import Foundation

struct OTPProvider {
    
    let secret: Array<UInt8>
    let digits: Int
    
    init(secret: String, digits: Int = 6) {
        self.secret = Array(secret.base32Decoded()!)
        self.digits = digits
    }
    
    func generate(counter: Int) -> String {
        return ""
    }
}
