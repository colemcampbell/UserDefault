//
//  UserDefaultKey.swift
//  
//
//  Created by Cole Campbell on 5/30/21.
//

import Foundation

public struct UserDefaultKey: RawRepresentable, ExpressibleByStringLiteral {
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public init(stringLiteral: String) {
        self.init(rawValue: stringLiteral)
    }
}
