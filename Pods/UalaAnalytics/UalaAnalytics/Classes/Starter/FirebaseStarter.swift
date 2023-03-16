//
//  FirebaseStarter.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 02/05/22.
//

import FirebaseCore
import FirebaseAnalytics

public enum FirebaseInstance: String {
    case base
    case copies
}

final class FirebaseStarter: AnalyticsStarter {
    private let credentials: FirebaseCredentials
    private let client: FirebaseApp.Type
    
    public init(credentials: FirebaseCredentials, client: FirebaseApp.Type = FirebaseApp.self) {
        self.credentials = credentials
        self.client = client
    }
    
    @MainActor
    func start(application: UIApplication,
               launchOptions: [UIApplication.LaunchOptionsKey : Any]?) async throws {
        if credentials.instance == .base {
            client.configure(options: mapFirebaseOptions(with: credentials))
        } else {
            client.configure(name: credentials.instance.rawValue, options: mapFirebaseOptions(with: credentials))
        }
    }
    
    private func mapFirebaseOptions(with credentials: FirebaseCredentials) -> FirebaseOptions {
        let firebaseOptions = FirebaseOptions(googleAppID: credentials.googleAppID,
                                              gcmSenderID: credentials.GCMSenderID)

        firebaseOptions.storageBucket = credentials.storageBucket
        firebaseOptions.databaseURL = credentials.databaseURL
        firebaseOptions.projectID = credentials.projectID
        firebaseOptions.clientID = credentials.clientID
        firebaseOptions.bundleID = credentials.bundleID
        firebaseOptions.apiKey = credentials.apiKey

        return firebaseOptions
    }
}
