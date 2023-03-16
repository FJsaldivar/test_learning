//
//  AppboyStarter.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 28/04/22.
//

import Appboy_iOS_SDK

final class AppboyStarter: AnalyticsStarter {
    private let credentials: AppboyCredentials
    private let client: Appboy.Type
    
    init(credentials: AppboyCredentials, client: Appboy.Type = Appboy.self) {
        self.credentials = credentials
        self.client = client
    }
    
    @MainActor
    func start(application: UIApplication,
               launchOptions: [UIApplication.LaunchOptionsKey : Any]?) async throws {
        
        client.start(withApiKey: credentials.brazeToken,
                     in: application,
                     withLaunchOptions: launchOptions)
    }
}
