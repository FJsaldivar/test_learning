//
//  Event.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 27/04/22.
//

public struct Event {
    public var name: String
    public var type: String?
    public var id: String?
    public var screen: String?
    public var customAtributes = [String: Any]()
    
    public init(name: String,
         type: String?,
         id: String?,
         screen: String?,
         customAtributes: [String: Any] = [String: Any]()) {
        
        self.id = id
        self.type = type
        self.name = name
        self.screen = screen
        self.customAtributes = customAtributes
    }
    
    public init(name: String) {
        self.name = name
    }
    
    public func params() -> [String: Any] {
        var attributes = [String: Any]()
        
        if let screen = screen {
            attributes["screen"] = screen
        }
        
        if let type = type {
            attributes["categoria"] = type
        }
        
        if let id = id {
            attributes["event_id"] = id
        }
        
        customAtributes.forEach { attributes[$0.key] = $0.value }
        
        return attributes
    }
}

extension Event: Equatable {
    public static func == (lhs: Event, rhs: Event) -> Bool {
        return lhs.name == rhs.name &&
        lhs.type == rhs.type &&
        lhs.id == rhs.id &&
        lhs.screen == rhs.screen &&
        compareAttributes(lhsAttributes: lhs.customAtributes,
                          rhsAttributes: rhs.customAtributes)
    }
    
    private static func compareAttributes(lhsAttributes: [String: Any],
                                   rhsAttributes: [String: Any]) -> Bool {
        for (key, value) in lhsAttributes {
            if let rhsValue = rhsAttributes[key] {
                if !compareAny(lhs: value, rhs: rhsValue) {
                    return false
                }
            } else {
                return false
            }
        }
        return true
    }
    
    private static func compareAny(lhs: Any, rhs: Any) -> Bool {
        guard let lhsValue = lhs as? AnyHashable,
              let rhsValue = rhs as? AnyHashable else {
            return false
        }
        
        return lhsValue == rhsValue
    }
}
