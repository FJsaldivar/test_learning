//
//  ServiceStatusManager.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 09/05/22.
//

final class ServiceStatusManager {
    private var services: [Analytics: ServiceStatus] = [:]
    static let sharedInstance = ServiceStatusManager()
    
    private init() {}
    
    func updateServiceStatus(service: Analytics, status: ServiceStatus) {
        services[service] = status
    }
    
    func status(for service: Analytics) -> ServiceStatus {
        return services[service] ?? .inactive
    }
}
