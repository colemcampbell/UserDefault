//
//  UserDefault+Initializers.swift
//  
//
//  Created by Cole Campbell on 3/28/21.
//

import Foundation
import Key

public extension UserDefault {
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value: RawRepresentable, Value.RawValue == Int {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value: RawRepresentable, Value.RawValue == String {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Int {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Double {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Float {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == String {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Data {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == URL {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Date {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Bool {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Array<Int> {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Array<Double> {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Array<Float> {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Array<String> {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Array<Data> {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Array<URL> {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Array<Date> {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Array<Bool> {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Int> {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Double> {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Float> {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, String> {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Data> {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, URL> {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Date> {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Bool> {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key)
    }
}
