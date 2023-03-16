//
//  AnalyticsRemoteConfigurationProvider.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 19/05/22.
//

public protocol AnalyticsRemoteConfigurationProvider: AnyObject {
    func fetchRemoteConfiguration() async throws -> RemoteConfiguration
}

public extension AnalyticsRemoteConfigurationProvider {
    public static func provider(isDevelopmentMode: Bool) -> AnalyticsRemoteConfigurationProvider {
        return FirebaseRemoteConfigurationProvider(isDevelopmentEnvironment: isDevelopmentMode)
    }
}
