//
//  Spy+Promise.swift
//  UalaLoans-Unit-UnitTest
//
//  Created by Francisco Javier Saldivar Rubio on 30/06/22.
//

import PromiseKit

extension Spy {
    
    public func onCall(parameters: Parameters) -> Promise<Stub> {
        do {
            return .value(try self.onCallThrows(parameters: parameters))
        } catch let error {
            return .init(error: error)
        }
    }
    
    public func onCallOptional(parameters: Parameters) -> Promise<Stub?> {
        do {
            return .value(try self.onCallOptional(parameters: parameters))
        } catch let error {
            return .init(error: error)
        }
    }
}
