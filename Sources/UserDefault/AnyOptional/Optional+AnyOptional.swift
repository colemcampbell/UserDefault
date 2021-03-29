//
//  Optional+AnyOptional.swift
//  
//
//  Created by Cole Campbell on 3/28/21.
//

import Foundation

extension Optional: AnyOptional {
    var isNil: Bool {
        self == nil
    }
}
