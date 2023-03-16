//
//  AmplitydeUserDataTracker.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 09/05/22.
//

import Amplitude

final class AmplitudeUserDataTracker: UserDataTracker {
    private let client: Amplitude
    
    init(client: Amplitude) {
        self.client = client
    }
    
    convenience init() {
        self.init(client: Amplitude.instance())
    }
    
    func trackUserID(_ ID: String) {
        client.setUserId(ID)
    }
    
    func tractUserFirstName(_ name: String) {
        // This property is not being tracked in amplitude
    }
    
    func trackUserLastName(_ lastName: String) {
        // This property is not being tracked in amplitude
    }
    
    func trackUserEmail(_ email: String) {
        // This property is not being tracked in amplitude
    }
    
    func trackUserPhone(_ phone: String) {
        // This property is not being tracked in amplitude
    }
    
    func trackUserImageURL(_ URL: String) {
        // This property is not being tracked in amplitude
    }
    
    func trackUserStatus(_ status: String) {
        // This property is not being tracked in amplitude
    }
    
    func trackUserBalance(_ balance: String) {
        // This property is not being tracked in amplitude
    }
}
