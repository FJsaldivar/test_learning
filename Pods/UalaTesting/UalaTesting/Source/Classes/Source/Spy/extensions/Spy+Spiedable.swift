//
//  Spy+validations.swift
//  UalaLoans
//
//  Created by Francisco Javier Saldivar Rubio on 01/07/22.
//

/// Spiedable adds the properties to validate our spy class or struct, contains the functions
/// - wasCalled
/// - reset // comes from SpyResetable
public protocol Spiedable: SpyReseteable {
    
    /// The struct spy property contains isInvoked if it calls wasCalled it will always return ``isInvoked```
    /// but Spideable is implemented in your Spy struct "struct myClassSpy: Spiedable", wasCalled returns true if any function was called
    /// or false if no function was called
    /// - Returns: returns true if called or false if not called
     func wasCalled() -> Bool
}

extension Spy: Spiedable {
    public func wasCalled() -> Bool {
        return isInvoked
    }
}

extension Spiedable {
    public func wasCalled() -> Bool {
        let mirror = Mirror.init(reflecting: self)
        return mirror.children.first(where: {
            ($0.value as? Spiedable)?.wasCalled() ?? false
            
        }) != nil
    }
}
