//
//  LoginRouterTest.swift
//  SOLIDTests
//
//  Created by Serena Donato on 30/03/2023.
//

import XCTest
import UalaAuth
import UalaTesting
@testable import SOLID

final class LoginRouterTest: XCTestCase {
    
    func makeSut() async -> (LoginRouter, UINavigationController) {
        let sut = LoginRouter()
        let mockLoginDemoViewType = await MockLoginDemoViewType()
        sut.view = mockLoginDemoViewType
        let navigation = await UINavigationController(rootViewController: sut.view!)
        return (sut, navigation)
    }
    
    func test_go_next_screen() async throws {
        let (sut, navigation) = await makeSut()
        
        await sut.goNextScreen()
        
        let topViewController = await navigation.topViewController
        let viewControllers = await navigation.viewControllers
        
        XCTAssertNotNil(topViewController)
        XCTAssertTrue(topViewController is HomeViewController)
        XCTAssertNotNil(topViewController as? HomeViewController)
        XCTAssertEqual(viewControllers.count, 2)
    }
}

class MockLoginDemoViewType: UIViewController, LoginDemoViewType {
    
    var presenter: UalaAuth.LoginDemoPresenterType?
    
    var showMessageSpy: Spy<Void, String> = .init()
    func show(message: String) {
        showMessageSpy.onCall(message)
    }
    
    var loadingSpy: Spy<Void, Bool> = .init()
    func loading(_ value: Bool) {
        loadingSpy.onCall(value)
    }
    
    var showAlertSpy: Spy<Void, UIAlertController> = .init()
    func show(alert: UIAlertController) {
        showAlertSpy.onCall(alert)
    }
}



