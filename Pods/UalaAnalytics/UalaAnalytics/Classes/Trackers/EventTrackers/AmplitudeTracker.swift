//
//  AmplitudeTracker.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 06/05/22.
//

import Amplitude

final class AmplitudeTracker: EventTracker {
    private let client: Amplitude
    
    init(client: Amplitude) {
        self.client = client
    }
    
    convenience init() {
        self.init(client: Amplitude.instance())
    }
    
    func trackEvent(_ event: Event) {
        let parameters = event.params()
        client.logEvent(event.name, withEventProperties: parameters)
    }
    
    func trackScreen(_ event: Event) {
        // Amplitude should not track screens at the moment. 
    }
    
    func trackRevenue(_ revenue: Revenue) {
        guard let amount = Double(revenue.amount) else { return }
        client.logRevenue(revenue.description ?? "",
                                         quantity: 1,
                                         price: amount as NSNumber)
    }
    
    func trackRevenueCustom(_ revenue: RevenueCustom) {
        let amplitudParameters: [String: Any] = [
            revenue.tagAmount: revenue.amountValue as Any,
            revenue.tagCurrency: revenue.currencyCode as Any
        ]
      
        let parameters: [String: Any] = amplitudParameters.merging(revenue.extraProperties) { $1 }
        client.logEvent(revenue.name, withEventProperties: parameters)
    }
    
    func trackAttribute(_ attribute: Attribute) {
        let identify: AMPIdentify = AMPIdentify()
        identify.set(attribute.name, value: attribute.value as? NSObject)
        client.identify(identify)
    }
    
    func trackUser(name: String) {
        // Amplitude does not support user tracking
    }
}
