//
//  AppboyTracker.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 06/05/22.
//

import Appboy_iOS_SDK

final class AppboyTracker: EventTracker {
    private let client: Appboy?
    
    init(client: Appboy?) {
        self.client = client
    }
    
    convenience init() {
        self.init(client: Appboy.sharedInstance())
    }
    
    func trackEvent(_ event: Event) {
        client?.logCustomEvent(event.name,
                                                withProperties: event.params())
    }
    
    func trackScreen(_ event: Event) {
        // Appboy is not suposed to track screens.
    }
    
    func trackRevenue(_ revenue: Revenue) {
        client?.logPurchase(revenue.description ?? "",
                                             inCurrency: "ARS",
                                             atPrice: NSDecimalNumber(string: revenue.amount))
    }
    
    func trackRevenueCustom(_ revenue: RevenueCustom) {
        client?.logPurchase(revenue.name,
                            inCurrency: revenue.currencyCode,
                            atPrice: .init(value: revenue.amountValue),
                            withProperties: revenue.extraProperties)
    }
    
    func trackAttribute(_ attribute: Attribute) {
        if let value = attribute.value as? String {
            client?.user.setCustomAttributeWithKey(attribute.name,
                                                                    andStringValue: value)
        } else if let value = attribute.value as? Bool {
            client?.user.setCustomAttributeWithKey(attribute.name,
                                                                    andBOOLValue: value)
        } else if let value = attribute.value as? Int {
            client?.user.setCustomAttributeWithKey(attribute.name,
                                                                    andIntegerValue: value)
        } else if let value = attribute.value as? Double {
            client?.user.setCustomAttributeWithKey(attribute.name,
                                                                    andDoubleValue: value)
        }
    }
    
    func trackUser(name: String) {
        // Appboy does not support user tracking
    }
}
