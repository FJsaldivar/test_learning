//
//  FirebaseRemoteConfiguration.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 19/05/22.
//
import FirebaseRemoteConfig

public final class FirebaseRemoteConfigurationProvider: AnalyticsRemoteConfigurationProvider {
    private let provider: RemoteConfig
    private let isDevelopmentEnvironment: Bool
    
    init(provider: RemoteConfig, isDevelopmentEnvironment: Bool) {
        self.provider = provider
        self.isDevelopmentEnvironment = isDevelopmentEnvironment
    }
    
    convenience init(isDevelopmentEnvironment: Bool) {
        self.init(provider: RemoteConfig.remoteConfig(),
                  isDevelopmentEnvironment: isDevelopmentEnvironment)
    }
    
    public func fetchRemoteConfiguration() async throws -> RemoteConfiguration {
        configureProvider()
        try await fetchProviderRemoteConfiguration()
        try await activateConfiguration()
        
        let appVersion = provider.configValue(forKey: appVersionKey()).numberValue
        let minimumAgeOfUsage = provider.configValue(forKey: minimalAgeOfUsageKey()).numberValue
        
        return RemoteConfiguration(buildNumber: Int(appVersion),
                                   minimumAgeForUsage: Int(minimumAgeOfUsage))
    }
    
    private func fetchProviderRemoteConfiguration() async throws {
        if try await provider.fetch(withExpirationDuration: providerTimeInterval()) != .success {
            throw RemoteConfigurationError()
        }
    }
    
    private func activateConfiguration() async throws {
        if try await provider.activate() == false {
            throw RemoteConfigurationError()
        }
    }
    
    private func configureProvider() {
        let settings = RemoteConfigSettings()
        if isDevelopmentEnvironment {
            settings.minimumFetchInterval = 0
        }
        provider.configSettings = settings
    }
    
    private func providerTimeInterval() -> TimeInterval {
        if isDevelopmentEnvironment {
            return 0
        } else {
            return 3600
        }
    }
    
    private func appVersionKey() -> String {
        if isDevelopmentEnvironment {
            return "test_min_version"
        }
        return "prod_min_version"
    }
    
    private func minimalAgeOfUsageKey() -> String {
        if isDevelopmentEnvironment {
            return "test_min_age"
        }
        return "prod_min_age"
    }
    
    struct RemoteConfigurationError: Error, LocalizedError {
        var errorDescription: String? {
            return "Provider failed to retrieve the remote configuration"
        }
    }
}
