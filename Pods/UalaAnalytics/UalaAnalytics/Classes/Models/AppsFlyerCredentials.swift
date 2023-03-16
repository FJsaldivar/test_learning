//
//  AppsFlyerModel.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 28/04/22.
//

public struct AppsFlyerCredentials {
    let appInviteOneLinkID: String
    let appsFlyerDevKey: String
    let appleAppID: String
    
    public init(appInviteOneLinkID: String,
         appsFlyerDevKey: String,
         appleAppID: String) {
        self.appInviteOneLinkID = appInviteOneLinkID
        self.appsFlyerDevKey = appsFlyerDevKey
        self.appleAppID = appleAppID
    }
}
