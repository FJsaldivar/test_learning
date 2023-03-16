//
//  AsyncRepositoryMonitorType.swift
//  UalaCore
//
//  Created by Andrés Abraham Bonilla Gómex on 25/02/23.
//

import Foundation

public struct AsyncRepositoryMonitor {
    public let api: UalaCore.APIRequest
    public let data: Data?
}

public protocol AsyncRepositoryMonitorType {
    func execute(succes: Bool, model: AsyncRepositoryMonitor) async
}
