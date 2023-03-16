//
//  AnalyticsUserActivityTracker.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 09/05/22.
//

final class AnalyticsUserActivityTracker: UserActivityTracker {
    private let trackers: [UserActivityTracker]
    
    init(trackers: [UserActivityTracker]) {
        self.trackers = trackers
    }
    
    func trackUserActivity(activity: NSUserActivity) {
        trackers.forEach { tracker in
            tracker.trackUserActivity(activity: activity)
        }
    }
    
    func trackOpenedURL(url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) {
        trackers.forEach { tracker in
            tracker.trackOpenedURL(url: url,
                                   options: options)
        }
    }
    
    func trackRemoteNotificationReceived(application: UIApplication, userInfo: [AnyHashable : Any], completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        trackers.forEach { tracker in
            tracker.trackRemoteNotificationReceived(application: application,
                                                    userInfo: userInfo,
                                                    completionHandler: completionHandler)
        }
    }
    
    func trackPushNotificationsAuthorization(isAuthorized: Bool) {
        trackers.forEach { tracker in
            tracker.trackPushNotificationsAuthorization(isAuthorized: isAuthorized)
        }
    }
    
    func trackDeviceToken(token: Data) {
        trackers.forEach { tracker in
            tracker.trackDeviceToken(token: token)
        }
    }
}
