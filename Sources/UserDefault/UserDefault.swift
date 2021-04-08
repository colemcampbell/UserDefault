//
//  UserDefault.swift
//
//
//  Created by Cole Campbell on 7/13/20.
//

import Foundation
import Combine
import Key
import AnyOptional

@propertyWrapper
public struct UserDefault<Value> {
    
    // MARK: Properties
    
    private let defaultValue: Value
    private let key: Key
    private let store: UserDefaults
    
    private let observer: Observer
    
    private var publisher: AnyPublisher<Value, Never> {
        self.observer.publisher
    }
    
    // MARK: Initializers
    
    private init(wrappedValue: Value, key: Key, store: UserDefaults) {
        self.defaultValue = wrappedValue
        self.key = key
        self.store = store
        self.observer = Observer(key: key, store: store)
    }
    
    // MARK: Property Wrapper Values
    
    public var projectedValue: (defaultValue: Value, key: Key, store: UserDefaults, publisher: AnyPublisher<Value, Never>) {
        (
            self.defaultValue,
            self.key,
            self.store,
            self.publisher
        )
    }
    
    public var wrappedValue: Value {
        get {
            if Value.self == URL.self || Value.self == URL?.self {
                return self.store.url(forKey: self.key.rawValue) as? Value ?? self.defaultValue
            } else {
                return self.store.object(forKey: self.key.rawValue) as? Value ?? self.defaultValue
            }
        }
        set {
            if
                let newValue = newValue as? AnyOptional,
                newValue.isNil
            {
                self.store.removeObject(forKey: self.key.rawValue)
            } else if let url = newValue as? URL {
                self.store.set(url, forKey: self.key.rawValue)
            } else {
                self.store.set(newValue, forKey: self.key.rawValue)
            }
        }
    }
}

// MARK: - Public Initializers

public extension UserDefault {
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value: RawRepresentable, Value.RawValue == Int {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value: RawRepresentable, Value.RawValue == String {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Int {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Double {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Float {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == String {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Data {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == URL {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Date {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Bool {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Array<Int> {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Array<Double> {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Array<Float> {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Array<String> {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Array<Data> {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Array<Date> {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Array<Bool> {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Int> {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Double> {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Float> {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, String> {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Data> {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Date> {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
    
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Bool> {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
}

// MARK: - Public Initializers for Optional Value

public extension UserDefault where Value: ExpressibleByNilLiteral {
    init(_ key: Key, store: UserDefaults = .standard) where Value == Int? {
        self.init(wrappedValue: nil, key: key, store: store)
    }
    
    init(_ key: Key, store: UserDefaults = .standard) where Value == Double? {
        self.init(wrappedValue: nil, key: key, store: store)
    }
    
    init(_ key: Key, store: UserDefaults = .standard) where Value == Float? {
        self.init(wrappedValue: nil, key: key, store: store)
    }
    
    init(_ key: Key, store: UserDefaults = .standard) where Value == String? {
        self.init(wrappedValue: nil, key: key, store: store)
    }
    
    init(_ key: Key, store: UserDefaults = .standard) where Value == Data? {
        self.init(wrappedValue: nil, key: key, store: store)
    }
    
    init(_ key: Key, store: UserDefaults = .standard) where Value == URL? {
        self.init(wrappedValue: nil, key: key, store: store)
    }
    
    init(_ key: Key, store: UserDefaults = .standard) where Value == Date? {
        self.init(wrappedValue: nil, key: key, store: store)
    }
    
    init(_ key: Key, store: UserDefaults = .standard) where Value == Bool? {
        self.init(wrappedValue: nil, key: key, store: store)
    }
    
    init(_ key: Key, store: UserDefaults = .standard) where Value == Array<Int>? {
        self.init(wrappedValue: nil, key: key, store: store)
    }
    
    init(_ key: Key, store: UserDefaults = .standard) where Value == Array<Double>? {
        self.init(wrappedValue: nil, key: key, store: store)
    }
    
    init(_ key: Key, store: UserDefaults = .standard) where Value == Array<Float>? {
        self.init(wrappedValue: nil, key: key, store: store)
    }
    
    init(_ key: Key, store: UserDefaults = .standard) where Value == Array<String>? {
        self.init(wrappedValue: nil, key: key, store: store)
    }
    
    init(_ key: Key, store: UserDefaults = .standard) where Value == Array<Data>? {
        self.init(wrappedValue: nil, key: key, store: store)
    }
    
    init(_ key: Key, store: UserDefaults = .standard) where Value == Array<Date>? {
        self.init(wrappedValue: nil, key: key, store: store)
    }
    
    init(_ key: Key, store: UserDefaults = .standard) where Value == Array<Bool>? {
        self.init(wrappedValue: nil, key: key, store: store)
    }
    
    init(_ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Int>? {
        self.init(wrappedValue: nil, key: key, store: store)
    }
    
    init(_ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Double>? {
        self.init(wrappedValue: nil, key: key, store: store)
    }
    
    init(_ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Float>? {
        self.init(wrappedValue: nil, key: key, store: store)
    }
    
    init(_ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, String>? {
        self.init(wrappedValue: nil, key: key, store: store)
    }
    
    init(_ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Data>? {
        self.init(wrappedValue: nil, key: key, store: store)
    }
    
    init(_ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Date>? {
        self.init(wrappedValue: nil, key: key, store: store)
    }
    
    init(_ key: Key, store: UserDefaults = .standard) where Value == Dictionary<String, Bool>? {
        self.init(wrappedValue: nil, key: key, store: store)
    }
}

// MARK: - Observer

extension UserDefault {
    private class Observer: NSObject {
        let key: Key
        let store: UserDefaults
        let publisher: AnyPublisher<Value, Never>
        
        private let subject = PassthroughSubject<Value, Never>()
        
        init(key: Key, store: UserDefaults) {
            self.key = key
            self.store = store
            self.publisher = self.subject.eraseToAnyPublisher()
            
            super.init()
            
            self.store.addObserver(
                self,
                forKeyPath: self.key.rawValue,
                options: [.initial, .new],
                context: nil
            )
        }
        
        override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
            guard
                keyPath == self.key.rawValue,
                object as? UserDefaults == self.store,
                let change = change,
                let value = change[.newKey] as? Value
            else { return }
            
            self.subject.send(value)
        }
        
        deinit {
            self.store.removeObserver(self, forKeyPath: self.key.rawValue, context: nil)
        }
    }
}
