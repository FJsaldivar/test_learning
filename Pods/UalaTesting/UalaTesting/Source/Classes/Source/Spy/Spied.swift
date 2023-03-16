//
//  Spied.swift
//  UalaTesting
//
//  Created by Francisco Javier Saldivar Rubio on 18/10/22.
//

@propertyWrapper
public struct Spied<Stub, Parameters> {
    public var wrappedValue: Spy<Stub, Parameters> = .init()
    public init() {
        // Intentionally unimplemented...
    }
}

extension Spied: Spiedable {
    public func wasCalled() -> Bool {
        wrappedValue.wasCalled()
    }
}
