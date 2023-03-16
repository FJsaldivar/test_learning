//
//  AnalyticsServices.swift
//  UalaAnalytics
//
//  Created by uala on 28/11/22.
//

public enum AnalyticsServices {
    case firebase(FirebaseCredentials)
    case appBoy(AppboyCredentials)
    case amplitude(AmplitudeCredentials)
    case appsFlyer(AppsFlyerCredentials)
    
    internal var analytic: Analytics {
        switch self {
        case .firebase:
            return .firebase
        case .appBoy:
            return .appBoy
        case .amplitude:
            return .amplitude
        case .appsFlyer:
            return .appsFlyer
        }
    }
    
    var starter: AnalyticsStarter {
        switch self {
        case .firebase(let credentials):
            return FirebaseStarter(credentials: credentials)
        case .appBoy(let credentials):
            return AppboyStarter(credentials: credentials)
        case .amplitude(let credentials):
            return AmplitudeStarter(credentials: credentials)
        case .appsFlyer(let credentials):
            return AppsFlyerStarter(credentials: credentials)
        }
    }
}
