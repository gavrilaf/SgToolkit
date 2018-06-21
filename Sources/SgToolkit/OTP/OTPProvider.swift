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
    
    init(secret: String, digits: Int = 6) {
        self.secret = Array(secret.base32Decoded()!)
        self.digits = digits
    }
    
    func generate(counter: UInt64) -> String {
        var counter = counter.bigEndian
        let data = Array(Data(bytes: &counter, count: MemoryLayout<UInt64>.size))
        
        let hmac = HMAC(key: secret, variant: .sha1)
        let hash = try! hmac.authenticate(data)

        var truncatedHash = hash.withUnsafeBufferPointer { (buf) -> UInt32 in
            let ptr = buf.baseAddress!
            
            // Use the last 4 bits of the hash as an offset (0 <= offset <= 15)
            let offset = ptr[hash.count - 1] & 0x0f
            
            // Take 4 bytes from the hash, starting at the given byte offset
            let truncatedHashPtr = ptr + Int(offset)
            return truncatedHashPtr.withMemoryRebound(to: UInt32.self, capacity: 1) {
                $0.pointee
            }
        }
        
        // Ensure the four bytes taken from the hash match the current endian format
        truncatedHash = UInt32(bigEndian: truncatedHash)
        // Discard the most significant bit
        truncatedHash &= 0x7fffffff
        // Constrain to the right number of digits
        truncatedHash = truncatedHash % UInt32(pow(10, Float(digits)))
        
        // Pad the string representation with zeros, if necessary
        return String(truncatedHash) //.padded(with: "0", toLength: digits)
    }
}
