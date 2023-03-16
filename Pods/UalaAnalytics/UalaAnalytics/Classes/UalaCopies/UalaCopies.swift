//
//  UalaCopiesInteractor.swift
//  UalaLoyalty
//
//  Created by Rodolfo Castillo on 07/11/22.
//

import Combine
import Foundation
import FirebaseCore
import FirebaseRemoteConfig

public class UalaCopies {
    
    fileprivate static func remoteConfig(for instance: FirebaseInstance) -> RemoteConfig? {
        guard let app = fireBaseInstance(named: instance) else { return nil }
        let config = RemoteConfig.remoteConfig(app: app)
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        config.configSettings = settings
        return config
    }
    
    fileprivate static func fireBaseInstance(named: FirebaseInstance) -> FirebaseApp? {
        FirebaseApp.app(name: named.rawValue)
    }
    
    public static func getCopies(for dic: UalaCopiesDictionary, within instance: FirebaseInstance) async throws -> Data? {
        let config = remoteConfig(for: instance)
        var responseData: Data?
        do {
            let status = await try? config?.fetch()
            if status == .success {
                await try config?.activate()
                responseData = config?.configValue(forKey: dic.key).dataValue
            }
        } catch {
            print("Config not fetched")
            print("Error: \(error.localizedDescription ?? "No error available.")")
        }
        return responseData
    }
}
