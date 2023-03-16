//
//  FirebaseCredentials.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 29/04/22.
//

public struct FirebaseCredentials {
    var apiKey: String
    var bundleID: String
    var clientID: String
    var GCMSenderID: String
    var projectID: String
    var googleAppID: String
    var databaseURL: String
    var storageBucket: String
    var instance: FirebaseInstance
    
    public init(apiKey: String,
         bundleID: String,
         clientID: String,
         GCMSenderID: String,
         projectID: String,
         googleAppID: String,
         databaseURL: String,
         storageBucket: String,
         instance: FirebaseInstance = .base) {
        self.apiKey = apiKey
        self.bundleID = bundleID
        self.clientID = clientID
        self.GCMSenderID = GCMSenderID
        self.projectID = projectID
        self.googleAppID = googleAppID
        self.databaseURL = databaseURL
        self.storageBucket = storageBucket
        self.instance = instance
    }
}
