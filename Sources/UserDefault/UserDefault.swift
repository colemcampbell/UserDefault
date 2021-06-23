//
//  UserDefault.swift
//
//
//  Created by Cole Campbell on 7/13/20.
//

import Foundation
import Combine
import AnyOptional

@propertyWrapper
public struct UserDefault<StoredValue: Codable> {
    
    // MARK: Properties
    
    private let store: Store
    
    private var publisher: AnyPublisher<StoredValue, Never> {
        self.store.publisher
    }
    
    // MARK: Initializers
    
    private init(wrappedValue: StoredValue, key: UserDefaultKey, userDefaults: UserDefaults) {
        self.store = Store(defaultValue: wrappedValue, key: key, userDefaults: userDefaults)
    }
    
    // MARK: Property Wrapper Values
    
    public var projectedValue: (
        defaultValue: StoredValue,
        key: UserDefaultKey,
        userDefaults: UserDefaults,
        publisher: AnyPublisher<StoredValue, Never>
    ) {
        (self.store.defaultValue, self.store.key, self.store.userDefaults, self.publisher)
    }
    
    public var wrappedValue: StoredValue {
        get {
            self.store.storedValue
        }
        
        set {
            self.store.storedValue = newValue
        }
    }
}

// MARK: - Public Initializers

extension UserDefault {
    public init(wrappedValue: StoredValue, _ key: UserDefaultKey, userDefaults: UserDefaults = .standard) {
        self.init(wrappedValue: wrappedValue, key: key, userDefaults: userDefaults)
    }
}

// MARK: - Public Initializers for Optional Value

extension UserDefault where StoredValue: ExpressibleByNilLiteral {
    public init(_ key: UserDefaultKey, userDefaults: UserDefaults = .standard) {
        self.init(wrappedValue: nil, key: key, userDefaults: userDefaults)
    }
}

// MARK: - Store

extension UserDefault {
    private class Store: NSObject {
        let defaultValue: StoredValue
        let key: UserDefaultKey
        let userDefaults: UserDefaults
        
        let publisher: AnyPublisher<StoredValue, Never>
        private let subject: CurrentValueSubject<StoredValue, Never>
        
        var storedValue: StoredValue {
            get {
                let storedValue: StoredValue?
                
                if StoredValue.self == Int.self || StoredValue.self == Int?.self {
                    storedValue = self.userDefaults.integer(forKey: self.key.rawValue) as? StoredValue
                } else if StoredValue.self == Double.self || StoredValue.self == Double?.self {
                    storedValue = self.userDefaults.double(forKey: self.key.rawValue) as? StoredValue
                } else if StoredValue.self == String.self || StoredValue.self == String?.self {
                    storedValue = self.userDefaults.string(forKey: self.key.rawValue) as? StoredValue
                } else if StoredValue.self == Data.self || StoredValue.self == Data?.self {
                    storedValue = self.userDefaults.data(forKey: self.key.rawValue) as? StoredValue
                } else if StoredValue.self == URL.self || StoredValue.self == URL?.self {
                    storedValue = self.userDefaults.url(forKey: self.key.rawValue) as? StoredValue
                } else if StoredValue.self == Bool.self || StoredValue.self == Bool?.self {
                    storedValue = self.userDefaults.bool(forKey: self.key.rawValue) as? StoredValue
                } else {
                    storedValue = self.decode(self.userDefaults.data(forKey: self.key.rawValue))
                }
                
                return storedValue ?? self.defaultValue
            }
            
            set {
                if
                    let optionalValue = newValue as? AnyOptional,
                    optionalValue.isNil
                {
                    self.userDefaults.removeObject(forKey: self.key.rawValue)
                } else if let newValue = newValue as? Int {
                    self.userDefaults.set(newValue, forKey: self.key.rawValue)
                } else if let newValue = newValue as? Double {
                    self.userDefaults.set(newValue, forKey: self.key.rawValue)
                } else if let newValue = newValue as? String {
                    self.userDefaults.set(newValue, forKey: self.key.rawValue)
                } else if let newValue = newValue as? Data {
                    self.userDefaults.set(newValue, forKey: self.key.rawValue)
                } else if let newValue = newValue as? URL {
                    self.userDefaults.set(newValue, forKey: self.key.rawValue)
                } else if let newValue = newValue as? Bool {
                    self.userDefaults.set(newValue, forKey: self.key.rawValue)
                } else {
                    self.userDefaults.set(self.encode(newValue), forKey: self.key.rawValue)
                }
            }
        }
        
        init(defaultValue: StoredValue, key: UserDefaultKey, userDefaults: UserDefaults) {
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
                object as? UserDefaults === self.userDefaults,
                let change = change,
                let _ = change[.newKey]
            else { return }
            
            self.subject.send(self.storedValue)
        }
        
        private func decode(_ data: Data?) -> StoredValue? {
            if
                let data = data,
                let value = try? JSONDecoder().decode(StoredValue.self, from: data)
            {
                return value
            } else {
                return nil
            }
        }
        
        private func encode(_ value: StoredValue) -> Data? {
            try? JSONEncoder().encode(value)
        }
    }
}
