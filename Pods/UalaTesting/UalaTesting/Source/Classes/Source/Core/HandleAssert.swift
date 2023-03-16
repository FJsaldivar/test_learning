//
//  HandleAssert.swift
//  Pods-UalaTesting_Example
//
//  Created by Francisco Javier Saldivar Rubio on 26/10/22.
//

import XCTest

public class HandleAssert {
    
    public init() {
        // intentional unimplement
    }
    
    func assertFail(_ message: String = "", file: StaticString = #filePath, line: UInt = #line) {
        XCTFail(message, file: file, line: line)
    }
    
    func assert(_ expression: @autoclosure () throws -> Bool,
                _ message: @autoclosure () -> String = "",
                file: StaticString = #filePath,
                line: UInt = #line) {
        let message = message()
        XCTAssert(try expression(), message, file: file, line: line)
    }
    
    func assertNil(_ expression: @autoclosure () throws -> Any?,
                   _ message: @autoclosure () -> String = "",
                   file: StaticString = #filePath,
                   line: UInt = #line) {
        let message = message()
        XCTAssertNil(try expression(), message, file: file, line: line)
    }
    
    func unwrap<T>(_ expression: @autoclosure () throws -> T?,
                   _ message: @autoclosure () -> String = "",
                   file: StaticString = #filePath,
                   line: UInt = #line) throws -> T {
        let message = message()
        return try XCTUnwrap(try expression(), message, file: file, line: line)
    }
}
