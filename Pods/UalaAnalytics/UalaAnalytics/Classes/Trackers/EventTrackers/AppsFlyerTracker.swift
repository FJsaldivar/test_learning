//
//  AppsFlyerTracker.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 05/05/22.
//

import AppsFlyerLib

final class AppsFlyerTracker: EventTracker {
    private typealias Values = [String: Any]
    private let client: AppsFlyerLib
    
    init(client: AppsFlyerLib) {
        self.client = client
    }
    
    convenience init() {
        self.init(client: AppsFlyerLib.shared())
    }
    
    func trackEvent(_ event: Event) {
        client.logEvent(event.name,
                                       withValues: mapAttributes(from: event))
    }
    
    func trackScreen(_ event: Event) {
        var values = ["name": event.name]
        
        if let type = event.type {
            values["category"] = type
        }
        
        client.logEvent(event.screen ?? "unnamed", withValues: values)
    }
    
    func trackRevenue(_ revenue: Revenue) {
        let values = [
            AFEventParamContentType: revenue.type,
            AFEventParamRevenue: revenue.amount,
            AFEventParamCurrency: "ARS"
        ]
        
        client.logEvent(AFEventPurchase, withValues: values)
    }
    
    func trackRevenueCustom(_ revenue: RevenueCustom) {
        let values = [
            AFEventParamContentType: revenue.tagAmount,
            AFEventParamRevenue: revenue.amountValue,
            AFEventParamCurrency: revenue.currencyCode as Any
        ]
        
        let parameters: [String: Any] = values.merging(revenue.extraProperties) { $1 }
        client.logEvent(revenue.name, withValues: parameters)
    }
    
    func trackAttribute(_ attribute: Attribute) {
        // Appsflyer is not suposed to track attributes at the moment.
    }
    
    func trackUser(name: String) {
        client.customerUserID = name
    }
    
    private func mapAttributes(from event: Event) -> Values {
        var parameters = Values()
        
        let customKeys = ["categoria": AFEventParamContentType,
                          "event_id": AFEventParamContentId]
        
        event.params().forEach {
            let key = customKeys[$0.key] ?? $0.key
            parameters[key] = $0.value
        }
        
        return parameters
    }
}
