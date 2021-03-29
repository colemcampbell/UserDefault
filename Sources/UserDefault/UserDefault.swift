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
public struct UserDefault<Value> {
    public let defaultValue: Value
    public let key: Key
    public let store: UserDefaults
    
    let observer: Observer
    
    public var publisher: AnyPublisher<Value, Never> {
        self.observer.publisher.eraseToAnyPublisher()
    }
    
    public var projectedValue: UserDefault<Value> {
        self
    }
    
    public var wrappedValue: Value {
        get {
            self.store.object(forKey: self.key.rawValue) as? Value ?? self.defaultValue
        }
        set {
            if
                let newValue = newValue as? AnyOptional,
                newValue.isNil
            {
                self.store.removeObject(forKey: self.key.rawValue)
            } else {
                self.store.set(newValue, forKey: self.key.rawValue)
            }
        }
    }
}
