//
//  AnalyticsTrackerProvider.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 06/05/22.
//

final class AnalyticsEventTracker: EventTracker {
    private let trackers: [EventTracker]
    
    init(trackers: [EventTracker]) {
        self.trackers = trackers
    }
    
    func trackEvent(_ event: Event) {
        trackers.forEach { tracker in
            tracker.trackEvent(event)
        }
    }
    
    func trackScreen(_ event: Event) {
        trackers.forEach { tracker in
            tracker.trackScreen(event)
        }
    }
    
    func trackRevenue(_ revenue: Revenue) {
        trackers.forEach { tracker in
            tracker.trackRevenue(revenue)
        }
    }
    
    func trackRevenueCustom(_ revenue: RevenueCustom) {
        trackers.forEach { tracker in
            tracker.trackRevenueCustom(revenue)
        }
    }
    
    func trackAttribute(_ attribute: Attribute) {
        trackers.forEach { tracker in
            tracker.trackAttribute(attribute)
        }
    }
    
    func trackUser(name: String) {
        trackers.forEach { tracker in
            tracker.trackUser(name: name)
        }
    }
}
