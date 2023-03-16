//
//  AppboyUserActivityTracker.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 09/05/22.
//
import Appboy_iOS_SDK

final class AppboyUserActivityTracker: UserActivityTracker {
    private let client: Appboy?
    
    init(client: Appboy?) {
        self.client = client
    }
    
    convenience init() {
        self.init(client: Appboy.sharedInstance())
    }
    
    func trackUserActivity(activity: NSUserActivity) {
        // This should not be tracked by Appboy
    }
    
    func trackOpenedURL(url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) {
        // This should not be tracked by Appboy
    }
    
    func trackRemoteNotificationReceived(application: UIApplication, userInfo: [AnyHashable : Any], completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        client?.register(application,
                         didReceiveRemoteNotification: userInfo,
                         fetchCompletionHandler: completionHandler)
    }
    
    func trackPushNotificationsAuthorization(isAuthorized: Bool) {
        client?.pushAuthorization(fromUserNotificationCenter: isAuthorized)
    }
    
    func trackDeviceToken(token: Data) {
        client?.registerDeviceToken(token)
    }
}
