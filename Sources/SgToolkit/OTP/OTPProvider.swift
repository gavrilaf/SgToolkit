//
//  OTPProvider.swift
//  SgToolkit
//
//  Created by Eugen Fedchenko on 6/21/18.
//

import Foundation
import CryptoSwift

struct OTPProvider {
    
    let secret: Array<UInt8>
    let digits: Int
    let hashFunc: HMAC.Variant
    
    init(secret: String, digits: Int = 6, hash: HMAC.Variant = .sha1) {
        self.secret = Array(secret.base32Decoded()!)
        self.digits = digits
        self.hashFunc = hash
    }
    
    func generate(counter: UInt64) -> String {
        var counter = counter.bigEndian
        let data = Array(Data(bytes: &counter, count: MemoryLayout<UInt64>.size))
        
        let hmac = HMAC(key: secret, variant: hashFunc)
        let hash = try! hmac.authenticate(data)

        var truncatedHash = hash.withUnsafeBufferPointer { (buf) -> UInt32 in
            let ptr = buf.baseAddress!
            let offset = ptr[hash.count - 1] & 0x0f
            let truncatedHashPtr = ptr + Int(offset)
            return truncatedHashPtr.withMemoryRebound(to: UInt32.self, capacity: 1) {
                $0.pointee
            }
        }
        
        truncatedHash = UInt32(bigEndian: truncatedHash)
        truncatedHash &= 0x7fffffff
        truncatedHash = truncatedHash % UInt32(pow(10, Float(digits)))
        
        return String(truncatedHash).padded(with: "0", toLength: digits)
    }
}
