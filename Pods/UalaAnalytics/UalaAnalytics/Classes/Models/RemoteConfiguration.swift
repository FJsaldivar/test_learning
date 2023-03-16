//
//  RemoteConfiguration.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 19/05/22.
//

public struct RemoteConfiguration {
    public let buildNumber: Int
    public let minimumAgeForUsage: Int
    
    public init(buildNumber: Int,
         minimumAgeForUsage: Int) {
        self.buildNumber = buildNumber
        self.minimumAgeForUsage = minimumAgeForUsage
    }
}
