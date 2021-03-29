//
//  AnyOptional.swift
//  
//
//  Created by Cole Campbell on 3/28/21.
//

import Foundation

protocol AnyOptional: ExpressibleByNilLiteral {
    var isNil: Bool { get }
}
