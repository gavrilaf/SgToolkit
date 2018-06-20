//
//  String+Encoding.swift
//  SgToolkit
//
//  Created by Eugen Fedchenko on 6/20/18.
//

import Foundation

extension String {
    
    public func base32Decoded() -> Data? {
        return Base32.decode(string: self)
    }
    
    public func base32Encoded() -> String {
        return utf8CString.withUnsafeBufferPointer {
            return Base32.encode(pointer: $0.baseAddress!, length: $0.count - 1)
        }
    }
    public func base32DecodedString(encoding: String.Encoding = .utf8) -> String? {
        return Base32.decode(string: self).flatMap {
            return String(data: $0, encoding: encoding)
        }
    }
}
