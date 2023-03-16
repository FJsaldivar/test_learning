//
//  Utils.swift
//  UalaTesting
//
//  Created by Francisco Javier Saldivar Rubio on 18/10/22.
//

import XCTest

extension String: Error { }

extension Optional {

    public func assertNil(file: StaticString = #file, line: UInt = #line) {
        XCTAssertOptionalNil(subject: self, file: file, line: line)
    }
    
    public func assertNotNil(file: StaticString = #file, line: UInt = #line) {
        XCTAssertOptionalNotNil(subject: self, file: file, line: line)
    }
}
