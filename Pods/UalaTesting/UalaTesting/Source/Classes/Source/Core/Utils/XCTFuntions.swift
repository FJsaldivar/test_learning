//
//  XCTFuntions.swift
//  UalaTesting
//
//  Created by Francisco Javier Saldivar Rubio on 18/10/22.
//

import XCTest

public func XCTAssertOptionalNil<T>(subject: Optional<T>, file: StaticString = #file, line: UInt = #line) {
    switch subject {
    case .none:
        XCTAssert(true)
    case .some(_):
        XCTFail("\(String(describing: subject)) not is nil", file: file, line: line)
    }
}

public func XCTAssertOptionalNotNil<T>(subject: Optional<T>, file: StaticString = #file, line: UInt = #line) {
    switch subject {
    case .none:
        XCTFail("\(String(describing: subject)) is nil", file: file, line: line)
    case .some(_):
        XCTAssert(true)
    }
}

public func XCTAssertEqual<T: UalaDummy>(_ lhs: T,_ rhs: T, file: StaticString = #file, line: UInt = #line) {
    let result = compare(lhs, rhs, file: file, line: line)
    let otherComparation = NSDictionary(dictionary: lhs.asDictionary()).isEqual(to: rhs.asDictionary())
    XCTAssert(result.status || otherComparation,
              result.message ?? "\(lhs.asDictionary()) not is equal to \(rhs.asDictionary())",
              file: file,
              line: line)
    XCTAssertEqual("", "")
}


public func XCTAssertEqualAsync<T>(_ expression1: @autoclosure () async throws -> T,
                                   _ expression2: @autoclosure () async throws -> T,
                                   _ message: @autoclosure () -> String = "",
                                   file: StaticString = #filePath,
                                   line: UInt = #line) async where T : Equatable {
    do {
        let expression1 = try await expression1()
        let expression2 = try await expression2()
        XCTAssertEqual(expression1, expression2, message(), file: file, line: line)
    } catch {
        XCTFail(error.localizedDescription, file: file, line: line)
    }
}


public func XCTAssertAsync(_ expression: @autoclosure () async throws -> Bool,
                           _ message: @autoclosure () -> String = "",
                           file: StaticString = #filePath,
                           line: UInt = #line) async {
    do {
        let expression = try await expression()
        XCTAssert(expression, message(), file: file, line: line)
    } catch {
        XCTFail(error.localizedDescription, file: file, line: line)
    }
}

public func XCTAssertTrueAsync(_ expression: @autoclosure () async throws -> Bool,
                               _ message: @autoclosure () -> String = "",
                               file: StaticString = #filePath,
                               line: UInt = #line) async {
    do {
        let expression = try await expression()
        XCTAssert(expression, message(), file: file, line: line)
    } catch {
        XCTFail(error.localizedDescription, file: file, line: line)
    }
}

public func XCTAssertFalseAsync(_ expression: @autoclosure () async throws -> Bool,
                                _ message: @autoclosure () -> String = "",
                                file: StaticString = #filePath,
                                line: UInt = #line) async {
    do {
        let expression = try await expression()
        XCTAssert(!expression, message(), file: file, line: line)
    } catch {
        XCTFail(error.localizedDescription, file: file, line: line)
    }
}
