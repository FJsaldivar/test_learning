//
//  AppsFlyerStarter.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 27/04/22.
//
import AppsFlyerLib

final class AppsFlyerStarter: AnalyticsStarter {
    private let credentials: AppsFlyerCredentials
    private let client: AppsFlyerLib
    
    init(credentials: AppsFlyerCredentials, client: AppsFlyerLib = AppsFlyerLib.shared()) {
        self.credentials = credentials
        self.client = client
    }
    
    func start(application: UIApplication,
               launchOptions: [UIApplication.LaunchOptionsKey: Any]?) async throws {
        client.appInviteOneLinkID = credentials.appInviteOneLinkID
        client.appsFlyerDevKey = credentials.appsFlyerDevKey
        client.appleAppID = credentials.appleAppID
        
//        AppsFlyerLib.shared().isDebug = mode == .development
        
        return try await withCheckedThrowingContinuation({ continuation in
            client.start { data, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume()
                }
            }
        })
    }
}
