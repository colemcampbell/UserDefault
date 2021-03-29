//
//  UserDefault+Optional.swift
//  
//
//  Created by Cole Campbell on 3/28/21.
//

import Foundation
import Key

extension UserDefault where Value: ExpressibleByNilLiteral {
    public init(_ key: Key, store: UserDefaults = .standard) where Value == Int? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    public init(_ key: Key, store: UserDefaults = .standard) where Value == Double? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    public init(_ key: Key, store: UserDefaults = .standard) where Value == Float? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    public init(_ key: Key, store: UserDefaults = .standard) where Value == String? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    public init(_ key: Key, store: UserDefaults = .standard) where Value == Data? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    public init(_ key: Key, store: UserDefaults = .standard) where Value == URL? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    public init(_ key: Key, store: UserDefaults = .standard) where Value == Date? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    public init(_ key: Key, store: UserDefaults = .standard) where Value == Bool? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    public init(_ key: Key, store: UserDefaults = .standard) where Value == Array<Int>? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    public init(_ key: Key, store: UserDefaults = .standard) where Value == Array<Double>? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    public init(_ key: Key, store: UserDefaults = .standard) where Value == Array<Float>? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    public init(_ key: Key, store: UserDefaults = .standard) where Value == Array<String>? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    public init(_ key: Key, store: UserDefaults = .standard) where Value == Array<Data>? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    public init(_ key: Key, store: UserDefaults = .standard) where Value == Array<URL>? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    public init(_ key: Key, store: UserDefaults = .standard) where Value == Array<Date>? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    public init(_ key: Key, store: UserDefaults = .standard) where Value == Array<Bool>? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    public init(_ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Int>? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    public init(_ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Double>? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    public init(_ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Float>? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    public init(_ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, String>? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    public init(_ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Data>? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    public init(_ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, URL>? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    public init(_ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Date>? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    public init(_ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Bool>? {
        self.defaultValue = nil
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
}
