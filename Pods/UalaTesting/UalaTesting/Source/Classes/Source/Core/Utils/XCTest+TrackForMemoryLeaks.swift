import XCTest

extension XCTestCase {
    static var memoryLeaksError: String {
        "Instance should have been deallocated. Potential memory leak."
    }
    
    public func trackMemoryLeaks(for instances: AnyObject...,
                                 file: StaticString = #file,
                                 line: UInt = #line,
                                 handle: HandleAssert = HandleAssert()) {
        for instance in instances {
            addTeardownBlock { [weak instance] in
                handle.assertNil(instance, XCTestCase.memoryLeaksError, file: file, line: line)
            }
        }
    }
}
