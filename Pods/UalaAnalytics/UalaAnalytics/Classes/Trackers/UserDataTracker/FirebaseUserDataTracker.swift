//
//  FirebaseUserDataTracker.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 09/05/22.
//

import FirebaseAnalytics

final class FirebaseUserDataTracker<T: FirebaseAnalytics.Analytics>: UserDataTracker {
    
    func trackUserID(_ ID: String) {
        T.setUserID(ID)
    }
    
    func tractUserFirstName(_ name: String) {
        // This property is not being tracked in firebase analytics
    }
    
    func trackUserLastName(_ lastName: String) {
        // This property is not being tracked in firebase analytics
    }
    
    func trackUserEmail(_ email: String) {
        // This property is not being tracked in firebase analytics
    }
    
    func trackUserPhone(_ phone: String) {
        // This property is not being tracked in firebase analytics
    }
    
    func trackUserImageURL(_ URL: String) {
        // This property is not being tracked in firebase analytics
    }
    
    func trackUserStatus(_ status: String) {
        // This property is not being tracked in firebase analytics
    }
    
    func trackUserBalance(_ balance: String) {
        // This property is not being tracked in firebase analytics
    }
}
