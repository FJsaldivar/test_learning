//
//  SubjectVerifier.swift
//  UalaTesting
//
//  Created by Francisco Javier Saldivar Rubio on 27/10/22.
//

import XCTest

struct SubjectVerifier<Subject> {
    private var subject: Subject
    private var mirror: Mirror
    private var handle: HandleAssert

    init(subject: Subject, handle: HandleAssert = HandleAssert()) {
        self.subject = subject
        self.mirror = Mirror(reflecting: self.subject)
        self.handle = handle
    }
    
    func verify<Subject>(is type: Subject.Type, file: StaticString = #file, line: UInt = #line) {
        
        handle.assert(subject is Subject , "\(subject) not is \(Subject.self)", file: file, line: line)
    }
    
    func verify<Dependency>(contains dependency: Dependency.Type, file: StaticString = #file, line: UInt = #line) {
        let state = mirror.children.contains(where: {
            $0.value is Dependency
        })
        handle.assert(state , "\(Dependency.self) not member in \(subject)", file: file, line: line)
    }
    
    func getSubjectVerifier<T>(attribute type: T.Type,
                     file: StaticString = #file,
                     line: UInt = #line) throws -> SubjectVerifier<T> {
        let child = getAttribute(of: T.self, file: file, line: line)
        guard let childUnwrapper = child else {
            handle.assertFail("\(T.self) not member in \(subject.self)", file: file, line: line)
            throw "\(T.self) not member in \(subject.self)"
        }
        return .init(subject: childUnwrapper, handle: handle)
    }
    
    private func getAttribute<T>(of type: T.Type = T.self,
                                 file: StaticString = #file,
                                 line: UInt = #line) -> T? {
        var result: T?
        for item in mirror.children {
            (item.value as? T).map { item in result = item }
        }
        guard let child = result else {
            handle.assertFail("\(T.self) not member in \(subject)", file: file, line: line)
            return nil
        }
        return child
    }
    
}
