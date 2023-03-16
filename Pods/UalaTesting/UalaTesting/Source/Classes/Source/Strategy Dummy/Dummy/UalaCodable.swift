//
//  UalaCodable.swift
//  UalaTesting
//
//  Created by Francisco J. Saldivar on 21/01/23.
//

import Foundation

extension UalaDummy {
    public static func dummyData() throws -> Data {
        return try JSONSerialization.data(withJSONObject: self.dummy().asJSON() as? [String: AnyObject] ?? [:])
    }
    
    public func data() throws -> Data {
        return try JSONSerialization.data(withJSONObject: asJSON() as? [String: AnyObject] ?? [:])
    }
}

// A RawValue `enum` can be reflected if it conforms to
protocol RawValueReflectable: Reflectable {}

// Add this protocol to your `struct` or `class`
public protocol Reflectable {
    func asJSON() -> Any?
}

extension Reflectable {
    public func asJSON() -> Any? {
        let mirror = Mirror(reflecting: self)
        guard mirror.children.count > 0 else { return self }
        var out: [String: Any] = [:]
        for case let (key?, value) in mirror.children {
            if let value = value as? Reflectable {
                out[key] = value.asJSON()
            }
        }
        return out
    }
}

extension String: Reflectable {}
extension Int: Reflectable {}
extension Float: Reflectable {}
extension Double: Reflectable {}
extension Bool: Reflectable {}

extension Array: Reflectable where Element: Reflectable {
    public func asJSON() -> Any? {
        return compactMap { $0.asJSON() }
    }
}

extension Optional: Reflectable where Wrapped: Reflectable {
    public func asJSON() -> Any? {
        switch self {
        case .some(let value):
            return value.asJSON()
        case .none:
            return nil
        }
    }
}

extension Dictionary: Reflectable where Key == String, Value: Reflectable  {
    public func asJSON() -> Any? {
        return mapValues { $0.asJSON() ?? $0 }
    }
}

extension RawValueReflectable where Self: RawRepresentable, Self.RawValue: Reflectable {
    internal func asJSON() -> Any? {
        return rawValue
    }
}
