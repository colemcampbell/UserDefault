//
//  UserDefault.swift
//
//
//  Created by Cole Campbell on 7/13/20.
//

import Foundation
import Combine
import Key

@propertyWrapper
public struct UserDefault<Value: Codable> {
    
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
    
    public var projectedValue: (
        defaultValue: Value,
        key: Key,
        store: UserDefaults,
        publisher: AnyPublisher<Value, Never>
    ) {
        (self.defaultValue, self.key, self.store, self.publisher)
    }
    
    public var wrappedValue: Value {
        get {
            if let data = self.store.data(forKey: self.key.rawValue) {
                let storedValue = try? JSONDecoder().decode(Value.self, from: data)
                return storedValue ?? self.defaultValue
            } else {
                return self.defaultValue
            }
        }
        set {
            let data = try? JSONEncoder().encode(newValue)
            self.store.set(data, forKey: self.key.rawValue)
        }
    }
}

// MARK: - Public Initializers

public extension UserDefault {
    init(wrappedValue: Value, _ key: Key, store: UserDefaults = .standard) {
        self.init(wrappedValue: wrappedValue, key: key, store: store)
    }
}

// MARK: - Public Initializers for Optional Value

public extension UserDefault where Value: ExpressibleByNilLiteral {
    init(_ key: Key, store: UserDefaults = .standard) {
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
                let data = change[.newKey] as? Data,
                let value = try? JSONDecoder().decode(Value.self, from: data)
            else { return }
            
            self.subject.send(value)
        }
        
        deinit {
            self.store.removeObserver(self, forKeyPath: self.key.rawValue, context: nil)
        }
    }
}
