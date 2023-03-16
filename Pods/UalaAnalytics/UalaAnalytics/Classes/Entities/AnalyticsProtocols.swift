//
//  EventTracker.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 27/04/22.
//
import Appboy_iOS_SDK

public protocol AnalyticsStarter: AnyObject {
    func start(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?) async throws
}

public protocol EventTracker: AnyObject {
    func trackUser(name: String)
    func trackEvent(_ event: Event)
    func trackScreen(_ event: Event)
    func trackRevenue(_ revenue: Revenue)
    func trackRevenueCustom(_ revenue: RevenueCustom)
    func trackAttribute(_ attribute: Attribute)
}

public protocol UserDataTracker: AnyObject {
    func trackUserID(_ ID: String)
    func tractUserFirstName(_ name: String)
    func trackUserLastName(_ lastName: String)
    func trackUserEmail(_ email: String)
    func trackUserPhone(_ phone: String)
    func trackUserImageURL(_ URL: String)
    func trackUserStatus(_ status: String)
    func trackUserBalance(_ balance: String)
}

public protocol UserActivityTracker: AnyObject {
    func trackUserActivity(activity: NSUserActivity)
    func trackOpenedURL(url: URL, options: [UIApplication.OpenURLOptionsKey: Any])
    func trackRemoteNotificationReceived(application: UIApplication,
                                                userInfo: [AnyHashable: Any],
                                                completionHandler: @escaping (UIBackgroundFetchResult) -> Void)
    func trackPushNotificationsAuthorization(isAuthorized: Bool)
    func trackDeviceToken(token: Data)
}

// This is for appboy only
public protocol ContentCardProvider {
    func refreshContentCards()
    func contentCards() -> [ABKContentCard]
}
