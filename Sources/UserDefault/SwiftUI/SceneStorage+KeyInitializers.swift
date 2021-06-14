//
//  SceneStorage+KeyInitializers.swift
//  
//
//  Created by Cole Campbell on 3/28/21.
//

import Foundation
import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public extension SceneStorage {
    init(wrappedValue: Value, _ key: UserDefaultKey) where Value: RawRepresentable, Value.RawValue == Int {
        self.init(wrappedValue: wrappedValue, key.rawValue)
    }
    
    init(wrappedValue: Value, _ key: UserDefaultKey) where Value: RawRepresentable, Value.RawValue == String {
        self.init(wrappedValue: wrappedValue, key.rawValue)
    }
    
    init(wrappedValue: Value, _ key: UserDefaultKey) where Value == Int {
        self.init(wrappedValue: wrappedValue, key.rawValue)
    }
    
    init(wrappedValue: Value, _ key: UserDefaultKey) where Value == Double {
        self.init(wrappedValue: wrappedValue, key.rawValue)
    }
    
    init(wrappedValue: Value, _ key: UserDefaultKey) where Value == String {
        self.init(wrappedValue: wrappedValue, key.rawValue)
    }
    
    init(wrappedValue: Value, _ key: UserDefaultKey) where Value == Data {
        self.init(wrappedValue: wrappedValue, key.rawValue)
    }
    
    init(wrappedValue: Value, _ key: UserDefaultKey) where Value == URL {
        self.init(wrappedValue: wrappedValue, key.rawValue)
    }
    
    init(wrappedValue: Value, _ key: UserDefaultKey) where Value == Bool {
        self.init(wrappedValue: wrappedValue, key.rawValue)
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public extension SceneStorage where Value: ExpressibleByNilLiteral {
    init(_ key: UserDefaultKey) where Value == Int? {
        self.init(key.rawValue)
    }
    
    init(_ key: UserDefaultKey) where Value == Double? {
        self.init(key.rawValue)
    }
    
    init(_ key: UserDefaultKey) where Value == String? {
        self.init(key.rawValue)
    }
    
    init(_ key: UserDefaultKey) where Value == Data? {
        self.init(key.rawValue)
    }
    
    init(_ key: UserDefaultKey) where Value == URL? {
        self.init(key.rawValue)
    }
    
    init(_ key: UserDefaultKey) where Value == Bool? {
        self.init(key.rawValue)
    }
}
