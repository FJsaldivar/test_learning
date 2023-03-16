//
//  AnalyticsServices.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 06/05/22.
//

public protocol TrackerProvider: AnyObject {
    static func eventTracker(services: [Analytics]) -> EventTracker
    static func userActivityTracker(for services: [Analytics]) -> UserActivityTracker
    static func userDataTracker(for services: [Analytics]) -> UserDataTracker
    static func contentCardProvider() -> ContentCardProvider
}

public extension TrackerProvider {
    static func eventTracker() -> EventTracker {
        return Self.eventTracker(services: Analytics.allCases)
    }
    
    static func userActivityTracker() -> UserActivityTracker {
        return Self.userActivityTracker(for: Analytics.allCases)
    }
    
    static func userDataTracker() -> UserDataTracker {
        return Self.userDataTracker(for: Analytics.allCases)
    }
}

final public class AnalyticServiceProvider: TrackerProvider {
    
    public static func eventTracker(services: [Analytics]) -> EventTracker {
        var trackers: [EventTracker] = []
        for service in services {
            if ServiceStatusManager.sharedInstance.status(for: service) == .active {
                trackers.append(service.eventTracker)
            }
        }
        return AnalyticsEventTracker(trackers: trackers)
    }
    
    public static func userActivityTracker(for services: [Analytics]) -> UserActivityTracker {
        var trackers: [UserActivityTracker] = []
        for service in services where service.userActivityTracker != nil {
            if ServiceStatusManager.sharedInstance.status(for: service) == .active,
               let tracker = service.userActivityTracker {
                trackers.append(tracker)
            }
        }
        return AnalyticsUserActivityTracker(trackers: trackers)
    }
    
    public static func userDataTracker(for services: [Analytics]) -> UserDataTracker {
        var trackers: [UserDataTracker] = []
        for service in services {
            if ServiceStatusManager.sharedInstance.status(for: service) == .active,
               let tracker = service.userDataTracker {
                trackers.append(tracker)
            }
        }
        return AnalyticsUserDataTracker(trackers: trackers)
    }
    
    public static func contentCardProvider() -> ContentCardProvider {
        return AppboyContentCardProvider()
    }
}
