//
//  UalaEquatable+Extensions.swift
//  UalaTesting-Unit-Tests
//
//  Created by Francisco J. Saldivar on 29/11/22.
//

import UIKit

/* Extend (some/all) fundamental (equatable) Swift types to PseudoEquatableType  */
extension Bool: PseudoEquatableType {}

extension Int: PseudoEquatableType {}
extension Int8: PseudoEquatableType {}
extension Int16: PseudoEquatableType {}
extension Int32: PseudoEquatableType {}
extension Int64: PseudoEquatableType {}

extension Double: PseudoEquatableType {}

extension Float: PseudoEquatableType {}
@available(iOS 14.0, *)
extension Float16: PseudoEquatableType {}
extension Float80: PseudoEquatableType {}

extension UInt: PseudoEquatableType {}
extension UInt8: PseudoEquatableType {}
extension UInt16: PseudoEquatableType {}
extension UInt32: PseudoEquatableType {}
extension UInt64: PseudoEquatableType {}

extension String : PseudoEquatableType {}
extension UIColor: PseudoEquatableType {}

extension Array: PseudoEquatableType where Element == PseudoEquatableType {
    public func isEqual(to other: PseudoEquatableType) -> Bool {
        if let o = other as? Self {
            return zip(self, o).enumerated().filter { $1.0.isEqual(to: $1.1) }.count == self.count
        }
        return false
    }
}
