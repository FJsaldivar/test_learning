//
//  LoginStatusDefaultTest.swift
//  SOLIDTests
//
//  Created by Serena Donato on 30/03/2023.
//


import XCTest
@testable import SOLID

final class LoginStatusDefaultTest: XCTestCase {
    
    func makeSut() -> LoginStatus {
        let sut = LoginStatusDefault()
        return sut
    }
    
    func test_set_login_status_true() throws {
        let sut = makeSut()
        let spectedStatus = true
        
        sut.setLoginStatus(isLogged: spectedStatus)
        
        XCTAssertEqual(sut.getLoginStatus(), spectedStatus)
    }
    
    func test_set_login_status_false() throws {
        let sut = makeSut()
        let spectedStatus = false
        
        sut.setLoginStatus(isLogged: spectedStatus)
        
        XCTAssertEqual(sut.getLoginStatus(), spectedStatus)
    }
    
    func test_set_login_status_default() throws {
        let sut = makeSut()
        
        XCTAssertEqual(sut.getLoginStatus(), false)
    }
}
