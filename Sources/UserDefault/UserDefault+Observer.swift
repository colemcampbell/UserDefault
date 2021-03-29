//
//  UserDefault+Observer.swift
//  
//
//  Created by Cole Campbell on 3/28/21.
//

import Foundation
import Combine
import Key

extension UserDefault {
    class Observer: NSObject {
        let key: Key
        let publisher = PassthroughSubject<Value, Never>()
        
        init(key: Key) {
            self.key = key
            
            super.init()
            
            UserDefaults.standard.addObserver(
                self,
                forKeyPath: self.key.rawValue,
                options: [.new],
                context: nil
            )
        }
        
        override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
            guard
                keyPath == self.key.rawValue,
                object != nil,
                let change = change,
                let value = change[.newKey] as? Value
            else { return }
            
            self.publisher.send(value)
        }
        
        deinit {
            UserDefaults.standard.removeObserver(self, forKeyPath: self.key.rawValue, context: nil)
        }
    }
}
