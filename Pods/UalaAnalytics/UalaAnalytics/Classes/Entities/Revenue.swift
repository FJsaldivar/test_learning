//
//  Revenue.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 27/04/22.
//

public struct Revenue {
    public var type: String
    public var amount: String
    public var description: String?
    
    public init(type: String, amount: String, description: String?) {
        self.type = type
        self.amount = amount
        self.description = description
    }
}

extension Revenue: Equatable {
    public static func == (lhs: Revenue, rhs: Revenue) -> Bool {
        return lhs.type == rhs.type &&
        lhs.amount == rhs.amount &&
        lhs.description == rhs.description
    }
}
