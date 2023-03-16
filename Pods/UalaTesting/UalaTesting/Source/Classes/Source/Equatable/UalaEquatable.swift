//
//  UalaEquatable.swift
//  UalaTesting-Unit-Tests
//
//  Created by Francisco J. Saldivar on 29/11/22.
//

import XCTest

public typealias UalaPseudoEquatable = PseudoEquatableType & EquatableConstruct

/*  Heterogeneous protocol acts as castable Equatable container used for
    property-by-property equality testing in EquatableConstruct   */
public protocol PseudoEquatableType {
    func isEqual(to other: PseudoEquatableType) -> Bool
}

extension PseudoEquatableType where Self : Equatable {
    public func isEqual(to other: PseudoEquatableType) -> Bool {
        if let o = other as? Self { return self == o }
        return false
    }
}

/*  EquatableConstruct and its conformance to Equatable  */
public protocol EquatableConstruct: Equatable { }

private func isValidChild(_ item: Mirror.Child) -> Bool {
    return (item.value is Optional<PseudoEquatableType> || (item.value is PseudoEquatableType)) ||
           (item.value is Array<PseudoEquatableType>) &&
           item.label != nil
}

private func failConform(_ subject: String,
                             _ item: Mirror.Child,
                             file: StaticString = #file,
                             line: UInt = #line,
                             handle: HandleAssert) -> Bool {
    let attribute = String(describing: item.label).replacingOccurrences(of: "Optional(", with: "").replacingOccurrences(of: ")", with: "")
    handle.assertFail("\(subject).\(attribute) not conforming PseudoEquatableType", file: file, line: line)
    return false
}

private func filterElements(_ subject: String,
                            mirror: Mirror,
                            file: StaticString = #file,
                            line: UInt = #line,
                            handle: HandleAssert) throws -> [Mirror.Child] {
    var onContinue = true
    let childrenLhs = mirror.children.filter {
        if isValidChild($0) {
            return true
        }
        let status = failConform("\(subject)", $0, file: file, line: line, handle: handle)
        if !status {
            onContinue = false
        }
        return status
    }
    if onContinue {
        return childrenLhs
    }
    throw "Error filter"
}

public func compare<T: EquatableConstruct>(_ lhs: T,
                                           _ rhs: T,
                                           file: StaticString = #file,
                                           line: UInt = #line,
                                           handle: HandleAssert = .init()) -> (status: Bool, message: String?) {

    let mirrorLhs = Mirror(reflecting: lhs)
    let mirrorRhs = Mirror(reflecting: rhs)
    
    guard let displayStyle = mirrorLhs.displayStyle,
        (displayStyle == .struct || displayStyle == .class) else {
        return (false, "\(T.self) Invalid use: type is not a construct.(\(String(describing: mirrorLhs.displayStyle))")
    }

    do {
        let childrenLhs = try filterElements("\(T.self)", mirror: mirrorLhs, file: file, line: line, handle: handle)
        let childrenRhs = try filterElements("\(T.self)", mirror: mirrorRhs, file: file, line: line, handle: handle)

        guard childrenLhs.count == childrenRhs.count else {
            return (false, nil)
        }

        let resultObjects = zip(
            childrenLhs.compactMap { $0.value as? PseudoEquatableType },
            childrenRhs.compactMap { $0.value as? PseudoEquatableType })
            .reduce(true) { $0 && $1.0.isEqual(to: $1.1) }
        let resultArray = zip(
            childrenLhs.compactMap { $0.value as? Array<PseudoEquatableType> },
            childrenRhs.compactMap { $0.value as? Array<PseudoEquatableType> })
            .reduce(true) { $0 && $1.0.isEqual(to: $1.1) }
        return (resultObjects && resultArray, nil)
    } catch {
        return (false, nil)
    }
}
