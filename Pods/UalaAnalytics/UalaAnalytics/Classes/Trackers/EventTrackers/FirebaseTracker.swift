//
//  FirebaseTracker.swift
//  UalaAnalytics
//
//  Created by uala on 05/05/22.
//
import FirebaseAnalytics

final class FirebaseTracker<T: FirebaseAnalytics.Analytics>: EventTracker {
    private typealias Parameters = [String: Any]
    
    func trackEvent(_ event: Event) {
        T.logEvent(event.name,
                   parameters: mapAttributes(from: event))
    }
    
    func trackScreen(_ event: Event) {
        var parameters: Parameters = [
            "name": event.name
        ]

        if let type = event.type {
            parameters["category"] = type
        }

        T.logEvent("Pantalla", parameters: parameters)
    }
    
    func trackRevenue(_ revenue: Revenue) {
        let parameters: Parameters = [
            AnalyticsParameterValue: revenue.amount,
            AnalyticsParameterCurrency: "ARS"
        ]

        T.logEvent(AnalyticsEventPurchase,
                           parameters: parameters)
    }
    
    func trackRevenueCustom(_ revenue: RevenueCustom) {
        let firebaseParameters: [String: Any] = [
                AnalyticsParameterValue: revenue.amountValue as Any,
                AnalyticsParameterCurrency: revenue.currencyCode as Any
        ]
        let parameters: [String: Any] = firebaseParameters.merging(revenue.extraProperties) { $1 }
        T.logEvent(revenue.name, parameters: parameters)
    }
    
    func trackAttribute(_ attribute: Attribute) {
        guard let stringValue = attribute.value as? String else { return }
        T.setUserProperty(attribute.name, forName: stringValue)
    }
    
    func trackUser(name: String) {
        // Firebase does not support user tracking
    }
    
    private func mapAttributes(from event: Event) -> Parameters {
        var parameters = Parameters()
        
        let customKeys = ["categoria": AnalyticsParameterContentType,
                          "event_id": AnalyticsParameterItemID,
                          "screen": AnalyticsParameterDestination]
        
        event.params().forEach {
            let key = customKeys[$0.key] ?? $0.key
            parameters[key] = $0.value
        }
        
        return parameters
    }
}
