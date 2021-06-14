//
//  AppStorage+KeyInitializers.swift
//  
//
//  Created by Cole Campbell on 3/28/21.
//

import Foundation
import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public extension AppStorage {
    init(wrappedValue: Value, _ key: UserDefaultKey, store: UserDefaults? = nil) where Value: RawRepresentable, Value.RawValue == Int {
        self.init(wrappedValue: wrappedValue, key.rawValue, store: store)
    }
    
    init(wrappedValue: Value, _ key: UserDefaultKey, store: UserDefaults? = nil) where Value: RawRepresentable, Value.RawValue == String {
        self.init(wrappedValue: wrappedValue, key.rawValue, store: store)
    }
    
    init(wrappedValue: Value, _ key: UserDefaultKey, store: UserDefaults? = nil) where Value == Int {
        self.init(wrappedValue: wrappedValue, key.rawValue, store: store)
    }
    
    init(wrappedValue: Value, _ key: UserDefaultKey, store: UserDefaults? = nil) where Value == Double {
        self.init(wrappedValue: wrappedValue, key.rawValue, store: store)
    }
    
    init(wrappedValue: Value, _ key: UserDefaultKey, store: UserDefaults? = nil) where Value == String {
        self.init(wrappedValue: wrappedValue, key.rawValue, store: store)
    }
    
    init(wrappedValue: Value, _ key: UserDefaultKey, store: UserDefaults? = nil) where Value == Data {
        self.init(wrappedValue: wrappedValue, key.rawValue, store: store)
    }
    
    init(wrappedValue: Value, _ key: UserDefaultKey, store: UserDefaults? = nil) where Value == URL {
        self.init(wrappedValue: wrappedValue, key.rawValue, store: store)
    }
    
    init(wrappedValue: Value, _ key: UserDefaultKey, store: UserDefaults? = nil) where Value == Bool {
        self.init(wrappedValue: wrappedValue, key.rawValue, store: store)
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public extension AppStorage where Value: ExpressibleByNilLiteral {
    init(_ key: UserDefaultKey, store: UserDefaults? = nil) where Value == Int? {
        self.init(key.rawValue, store: store)
    }
    
    init(_ key: UserDefaultKey, store: UserDefaults? = nil) where Value == Double? {
        self.init(key.rawValue, store: store)
    }
    
    init(_ key: UserDefaultKey, store: UserDefaults? = nil) where Value == String? {
        self.init(key.rawValue, store: store)
    }
    
    init(_ key: UserDefaultKey, store: UserDefaults? = nil) where Value == Data? {
        self.init(key.rawValue, store: store)
    }
    
    init(_ key: UserDefaultKey, store: UserDefaults? = nil) where Value == URL? {
        self.init(key.rawValue, store: store)
    }
    
    init(_ key: UserDefaultKey, store: UserDefaults? = nil) where Value == Bool? {
        self.init(key.rawValue, store: store)
    }
}
