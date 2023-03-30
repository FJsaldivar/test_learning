//
//  Double+Variables.swift
//  UalaUtils
//
//  Created by Andrés Abraham Bonilla Gómex on 06/10/21.
//

import Foundation

public extension Double {
    
    public var strDecimalWithComma: String {
        return "\(self)".replacingOccurrences(of: ".", with: ",")
    }
    
    func doubleToCurrency(digits: Int = 2, identifier: String) -> String {
        let formatter = NumberFormatter()
        formatter.locale = NSLocale(localeIdentifier: identifier) as Locale
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = digits
        formatter.minimumFractionDigits = digits
        
        guard let strAmount = formatter.string(from: NSNumber(value: self)) else {
            return "$0,0"
        }
        
        return strAmount
    }
}
