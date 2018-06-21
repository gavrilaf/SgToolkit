//
//  String+Foundation.swift
//  SgToolkit
//
//  Created by Eugen Fedchenko on 6/21/18.
//

import Foundation

extension String {
    
    public func padded(with character: Character, toLength length: Int, left: Bool = true) -> String {
        let paddingCount = length - count
        guard paddingCount > 0 else {
            return self
        }
        
        let padding = String(repeating: String(character), count: paddingCount)
        return left ? padding + self : self + padding
    }
}
