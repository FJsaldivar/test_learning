//
//  Trackers.swift
//  UalaAnalytics
//
//  Created by uala on 05/05/22.
//

public enum Analytics {
    case firebase
    case appBoy
    case amplitude
    case appsFlyer
}
// Analytics+EXT
extension Analytics {
    var eventTracker: EventTracker {
        switch self {
        case .firebase:
            return FirebaseTracker()
        case .appBoy:
            return AppboyTracker()
        case .amplitude:
            return AmplitudeTracker()
        case .appsFlyer:
            return AppsFlyerTracker()
        }
    }
    
    var userActivityTracker: UserActivityTracker? {
        switch self {
        case .firebase, .amplitude:
            return nil
        case .appBoy:
            return AppboyUserActivityTracker()
        case .appsFlyer:
            return AppsFlyerUserActivityTracker()
        }
    }
    
    var contentCardProvider: ContentCardProvider? {
        switch self {
        case .firebase, .amplitude, .appsFlyer:
            return nil
        case .appBoy:
            return AppboyContentCardProvider()
        }
    }
    
    var userDataTracker: UserDataTracker? {
        switch self {
        case .firebase:
            return FirebaseUserDataTracker()
        case .appBoy:
            return AppboyUserDataTracker()
        case .amplitude:
            return AmplitudeUserDataTracker()
        case .appsFlyer:
            return nil
        }
    }
}

extension Analytics: CaseIterable {}
