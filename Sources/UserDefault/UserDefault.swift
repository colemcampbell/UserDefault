//
//  UserDefault.swift
//
//
//  Created by Cole Campbell on 7/13/20.
//

import Foundation
import Combine

@propertyWrapper
public struct UserDefault<Value: Codable> {
    
    // MARK: Properties
    
    private let store: Store
    
    private var publisher: AnyPublisher<Value, Never> {
        self.store.publisher
    }
    
    // MARK: Initializers
    
    private init(wrappedValue: Value, key: UserDefaultKey, userDefaults: UserDefaults) {
        self.store = Store(defaultValue: wrappedValue, key: key, userDefaults: userDefaults)
    }
    
    // MARK: Property Wrapper Values
    
    public var projectedValue: (
        defaultValue: Value,
        key: UserDefaultKey,
        userDefaults: UserDefaults,
        publisher: AnyPublisher<Value, Never>
    ) {
        (self.store.defaultValue, self.store.key, self.store.userDefaults, self.publisher)
    }
    
    public var wrappedValue: Value {
        get {
            self.store.value
        }
        
        set {
            self.store.value = newValue
        }
    }
}

// MARK: - Public Initializers

extension UserDefault {
    public init(wrappedValue: Value, _ key: UserDefaultKey, userDefaults: UserDefaults = .standard) {
        self.init(wrappedValue: wrappedValue, key: key, userDefaults: userDefaults)
    }
}

// MARK: - Public Initializers for Optional Value

extension UserDefault where Value: ExpressibleByNilLiteral {
    public init(_ key: UserDefaultKey, userDefaults: UserDefaults = .standard) {
        self.init(wrappedValue: nil, key: key, userDefaults: userDefaults)
    }
}

// MARK: - Store

extension UserDefault {
    private class Store: NSObject {
        let defaultValue: Value
        let key: UserDefaultKey
        let userDefaults: UserDefaults
        
        let publisher: AnyPublisher<Value, Never>
        private let subject: CurrentValueSubject<Value, Never>
        
        var value: Value {
            get {
                if Value.self == Int.self || Value.self == Int?.self {
                    return self.userDefaults.integer(forKey: self.key.rawValue) as! Value
                } else if Value.self == Double.self || Value.self == Double?.self {
                    return self.userDefaults.double(forKey: self.key.rawValue) as! Value
                } else if Value.self == String.self || Value.self == String?.self {
                    return self.userDefaults.string(forKey: self.key.rawValue) as! Value
                } else if Value.self == Data.self || Value.self == Data?.self {
                    return self.userDefaults.data(forKey: self.key.rawValue) as! Value
                } else if Value.self == URL.self || Value.self == URL?.self {
                    return self.userDefaults.url(forKey: self.key.rawValue) as! Value
                } else if Value.self == Bool.self || Value.self == Bool?.self {
                    return self.userDefaults.bool(forKey: self.key.rawValue) as! Value
                } else {
                    return self.value(from: self.userDefaults.data(forKey: self.key.rawValue))
                }
            }
            
            set {
                if
                    Value.self == Int.self || Value.self == Int?.self ||
                    Value.self == Double.self || Value.self == Double?.self ||
                    Value.self == String.self || Value.self == String?.self ||
                    Value.self == Data.self || Value.self == Data?.self ||
                    Value.self == Bool.self || Value.self == Bool?.self
                {
                    self.userDefaults.set(newValue, forKey: self.key.rawValue)
                } else if Value.self == URL.self || Value.self == URL?.self {
                    self.userDefaults.set(newValue as! URL?, forKey: self.key.rawValue)
                } else {
                    self.userDefaults.set(self.data(from: newValue), forKey: self.key.rawValue)
                }
            }
        }
        
        init(defaultValue: Value, key: UserDefaultKey, userDefaults: UserDefaults) {
            self.defaultValue = defaultValue
            self.key = key
            self.userDefaults = userDefaults
            
            self.subject = CurrentValueSubject(self.defaultValue)
            self.publisher = self.subject.eraseToAnyPublisher()
            
            super.init()
            
            self.userDefaults
                .addObserver(
                    self,
                    forKeyPath: self.key.rawValue,
                    options: [.initial, .new],
                    context: nil
                )
        }
        
        deinit {
            self.userDefaults.removeObserver(self, forKeyPath: self.key.rawValue, context: nil)
        }
        
        override func observeValue(
            forKeyPath keyPath: String?,
            of object: Any?,
            change: [NSKeyValueChangeKey: Any]?,
            context: UnsafeMutableRawPointer?
        ) {
            guard
                keyPath == self.key.rawValue,
                object as? UserDefaults == self.userDefaults,
                let change = change,
                let newValue = change[.newKey]
            else { return }
            
            if
                Value.self == Int.self || Value.self == Int?.self ||
                Value.self == Double.self || Value.self == Double?.self ||
                Value.self == String.self || Value.self == String?.self ||
                Value.self == Data.self || Value.self == Data?.self ||
                Value.self == Bool.self || Value.self == Bool?.self
            {
                self.subject.send(newValue as? Value ?? self.defaultValue)
            } else if Value.self == URL.self || Value.self == URL?.self {
                self.subject.send((newValue as? URL?) as? Value ?? self.defaultValue)
            } else {
                self.subject.send(self.value(from: newValue as? Data))
            }
        }
        
        private func value(from data: Data?) -> Value {
            if
                let data = data,
                let value = try? JSONDecoder().decode(Value.self, from: data)
            {
                return value
            } else {
                return self.defaultValue
            }
        }
        
        private func data(from value: Value) -> Data? {
            try? JSONEncoder().encode(value)
        }
    }
}
