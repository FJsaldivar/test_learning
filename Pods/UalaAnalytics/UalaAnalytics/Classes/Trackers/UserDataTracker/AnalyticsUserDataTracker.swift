//
//  AnalyticsUserDataTracker.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 09/05/22.
//

final class AnalyticsUserDataTracker: UserDataTracker {
    private let trackers: [UserDataTracker]
    
    init(trackers: [UserDataTracker]) {
        self.trackers = trackers
    }
    
    func trackUserID(_ ID: String) {
        trackers.forEach { tracker in
            tracker.trackUserID(ID)
        }
    }
    
    func tractUserFirstName(_ name: String) {
        trackers.forEach { tracker in
            tracker.tractUserFirstName(name)
        }
    }
    
    func trackUserLastName(_ lastName: String) {
        trackers.forEach { tracker in
            tracker.trackUserLastName(lastName)
        }
    }
    
    func trackUserEmail(_ email: String) {
        trackers.forEach { tracker in
            tracker.trackUserEmail(email)
        }
    }
    
    func trackUserPhone(_ phone: String) {
        trackers.forEach { tracker in
            tracker.trackUserPhone(phone)
        }
    }
    
    func trackUserImageURL(_ URL: String) {
        trackers.forEach { tracker in
            tracker.trackUserImageURL(URL)
        }
    }
    
    func trackUserStatus(_ status: String) {
        trackers.forEach { tracker in
            tracker.trackUserStatus(status)
        }
    }
    
    func trackUserBalance(_ balance: String) {
        trackers.forEach { tracker in
            tracker.trackUserBalance(balance)
        }
    }
}
