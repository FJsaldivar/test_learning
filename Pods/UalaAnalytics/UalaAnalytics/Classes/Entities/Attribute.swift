//
//  Attributes.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 27/04/22.
//

public struct Attribute {
    public var name: String
    public var value: Any

    public init(key: String, value: Any) {
        name = key
        self.value = value
    }
}
extension Attribute: Equatable {
    public static func == (lhs: Attribute, rhs: Attribute) -> Bool {
        guard let lhsValue = lhs.value as? AnyHashable,
              let rhsValue = rhs.value as? AnyHashable else {
            return false
        }
        
        return lhs.name == rhs.name &&
        lhsValue == rhsValue
    }
}
