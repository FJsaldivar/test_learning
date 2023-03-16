//
//  AmplitudeStarter.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 28/04/22.
//

import Amplitude

final class AmplitudeStarter: AnalyticsStarter {
    private let credentials: AmplitudeCredentials
    private let client: Amplitude
    
    init(credentials: AmplitudeCredentials, client: Amplitude = Amplitude.instance()) {
        self.credentials = credentials
        self.client = client
    }
    
    func start(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey : Any]?) async throws {
        return await withCheckedContinuation({ continuation in
            client.initCompletionBlock = {
                continuation.resume()
            }
            
            client.initializeApiKey(credentials.amplitudeToken)
        })
    }
}
