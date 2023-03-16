//
//  LoginEventsTest.swift
//  SOLIDTests
//
//  Created by Serena Donato on 16/03/2023.
//

import XCTest
import UalaTesting
import UalaCore
@testable import UalaAuth
@testable import UalaUtils
@testable import SOLID

final class LoginEventsTest: XCTestCase {
    
    func makeSut() async -> (LoginEvents, (MockLogManager, MockLoginStatus)) {
        let mockLogManager = MockLogManager()
        let mockLoginStatus = MockLoginStatus()
        let sut = LoginEvents(logManager: mockLogManager, loginStatus: mockLoginStatus)
        return (sut,(mockLogManager, mockLoginStatus))
    }
    
    func test_login_success() async throws {
        let (sut,(mockLogManager, mockLoginStatus)) = await makeSut()
        let scheme: Scheme = .develop
        let country: CountryEnvironment = .Argentina
        let spectedLoginData = try LoginData.dummy()
        
        await sut.loginSuccess(scheme: scheme, country: country, loginData: spectedLoginData)
        
        XCTAssertEqual(mockLogManager.debugSpy.invokedCount, 2)
        XCTAssertEqual(mockLoginStatus.setLoginStatusSpy.invokedCount, 1)
    }
}

class MockLogManager: LogManager {
    var debugSpy: Spy<Void,Any> = .init()
    override func debug(info: Any, detailed: Bool = true, fileName: String = #file, lineNumber: Int = #line) {
        debugSpy.onCall(info)
    }
    
    var debugErrorSpy: Spy<Void,Error?> = .init()
    override func debugError(error: Error?, type: Any, fileName: String = #file, lineNumber: Int = #line) {
        debugErrorSpy.onCall(error)
    }
}

class MockLoginStatus: LoginStatus {
    var setLoginStatusSpy: Spy<Void,Bool> = .init()
    func setLoginStatus(isLogged: Bool) {
        setLoginStatusSpy.onCall(isLogged)
    }
    
    var getLoginStatusSpy: Spy<Bool,Void> = .init()
    func getLoginStatus() -> Bool {
        return getLoginStatusSpy.onCall(()) ?? false
    }
}

extension LoginData: UalaDummy {}
