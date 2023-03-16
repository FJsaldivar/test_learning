//
//  AppsFlyerUserActivityTracker.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 09/05/22.
//

import AppsFlyerLib

final class AppsFlyerUserActivityTracker: UserActivityTracker {
    private let client: AppsFlyerLib
    
    init(client: AppsFlyerLib) {
        self.client = client
    }
    
    convenience init() {
        self.init(client: AppsFlyerLib.shared())
    }
    
    func trackUserActivity(activity: NSUserActivity) {
        client.continue(activity)
    }
    
    func trackOpenedURL(url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) {
        client.handleOpen(url,
                          options: options)
    }
    
    func trackRemoteNotificationReceived(application: UIApplication, userInfo: [AnyHashable : Any], completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        client.handlePushNotification(userInfo)
    }
    
    func trackPushNotificationsAuthorization(isAuthorized: Bool) {
        // This shold not be tracked by AppsFlyer
    }
    
    func trackDeviceToken(token: Data) {
        // This shold not be tracked by AppsFlyer
    }
}
