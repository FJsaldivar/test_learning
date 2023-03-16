//
//  Revenue.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 27/04/22.
//

public struct RevenueCustom {
    public var name: String
    public var amountValue: Double
    public var tagAmount: String
    public var tagCurrency: String
    public var extraProperties: [String: Any]
    public var currencyCode: String
    
    public init(name: String,
                tagAmount: String,
                tagCurrency: String,
                amountValue: Double,
                extraProperties: [String: Any] = [:],
                currencyCode: String) {
        self.name = name
        self.amountValue = amountValue
        self.tagAmount = tagAmount
        self.tagCurrency = tagCurrency
        self.extraProperties = extraProperties
        self.currencyCode = currencyCode
    }
}

extension RevenueCustom: Equatable {
    public static func == (lhs: RevenueCustom, rhs: RevenueCustom) -> Bool {
        return lhs.name == rhs.name &&
        lhs.amountValue == rhs.amountValue &&
        lhs.tagAmount == rhs.tagAmount &&
        lhs.currencyCode == rhs.currencyCode
    }
}
