//
//  Spy.swift
//  UalaLoans_Tests
//
//  Created by Francisco Javier Saldivar Rubio on 03/03/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import XCTest

public enum SpyError: String, Error {
    case errorNotSuported = "Not suported set Error in this Function"
    case stubAndErrorNil = "Stub and Error not setting"
}

public final class Spy<Stub, Parameters> {

    public var isInvoked: Bool = false
    public var invokedCount: Int = 0

    /// Replace the stubbed value
    /// Change the error value to null
    public var stubbed: Stub? {
        didSet {
            if stubbed != nil {
                self.error = nil
            }
        }
    }

    /// Replace the error value
    /// Change the stubbed value to null
    public var error: Error? {
        didSet {
            if error != nil {
                self.stubbed = nil
            }
        }
    }

    public var invokedParameters: Parameters?
    public var invokedParametersList: [Parameters] = []
    private var handle: HandleAssert
    
    public init(handle: HandleAssert = HandleAssert()) {
        self.handle = handle
    }
}

extension Spy {
    
    public func onCall(_ parameters: Parameters,
                file: StaticString = #file,
                line: UInt = #line) -> Stub? {
        do {
            return try onCallValidation(parameters)
        } catch {
            handle.assertFail(SpyError.errorNotSuported.rawValue, file: file, line: line)
            return nil
        }
    }
    
    /// Valida if stubed is optional or is required if is required and stubbed is null return exeption for default,
    /// if not required and stubbed is null return null
    /// - Parameter parameters: parameter recivde in function ``function a(parameters)``
    /// - Returns: stubbed or exeption
    private func onCallValidation(_ parameters: Parameters,
                                  file: StaticString = #file,
                                  line: UInt = #line) throws -> Stub? {
        return  isOptional(stubbed) ? try onCallThrows(parameters: parameters) : try onCallOptional(parameters: parameters)
    }
    
    /// If the dummy value has a value, it returns the dummy value otherwise
    /// if error has a value it will return it if not by default it will return the error UalaError.undefined
    /// - Returns: stubbed
    public func onCallThrows(parameters: Parameters,
                             file: StaticString = #file,
                             line: UInt = #line) throws -> Stub {
        invoke(parameters: parameters)
          
        if Stub.self == Void.self && error == nil {
            stubbed = () as? Stub
        }
        guard let stubbed = stubbed else {
            guard let error = error else {
                handle.assertFail(SpyError.stubAndErrorNil.rawValue,
                                  file: file,
                                  line: line)
                throw SpyError.stubAndErrorNil
            }
            throw error
        }
    
        return stubbed
    }
    
    public func onCallOptional(parameters: Parameters) throws -> Stub? {
        invoke(parameters: parameters)
          
        if Stub.self == Void.self && error == nil {
            stubbed = () as? Stub
        }
        
        guard let error = error else {
            return stubbed
        }
        
        throw error
    }

    private func invoke(parameters: Parameters) {
        invokedParameters = parameters
        invokedParametersList.append(parameters)
        isInvoked = true
        invokedCount += 1
    }
    
    private func isOptional(_ instance: Any?) -> Bool {
        guard let instance = instance else {
            return true
        }
        let mirror = Mirror(reflecting: instance)
        let style = mirror.displayStyle
        return style == .optional
    }
}
