//
//  AnalitycsModuleStarter.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 06/05/22.
//

public struct AnalyticsModuleStarter {
    
    public static func start(services: [AnalyticsServices],
                      application: UIApplication,
                      launchOptions: [UIApplication.LaunchOptionsKey : Any]?) async throws {
        
        for service in services {
            if await ServiceStatusManager.sharedInstance.status(for: service.analytic) == .inactive {
                try await service.starter.start(application: application,
                                                launchOptions: launchOptions)
                await ServiceStatusManager.sharedInstance.updateServiceStatus(service: service.analytic,
                                                                              status: .active)
            }
        }
    }
}
