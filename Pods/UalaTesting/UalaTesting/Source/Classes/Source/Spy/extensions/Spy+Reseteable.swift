//
//  Spy+Reseteable.swift
//  UalaLoans-Unit-UnitTest
//
//  Created by Francisco Javier Saldivar Rubio on 30/06/22.
//

public protocol SpyReseteable {
    func reset()
}

extension SpyReseteable {
    public func reset() {
        let mirror = Mirror.init(reflecting: self)
        mirror.children.forEach { child in
            guard let reseteable = child.value as? SpyReseteable else {
                return
            }
            reseteable.reset()
        }
    }
}

extension Spy: SpyReseteable {
    
    /// reset variables to their initial state
    public func reset() {
        stubbed = nil
        invokedParameters = nil
        invokedParametersList = []
        isInvoked = false
        invokedCount = 0
        error = nil
    }
}
