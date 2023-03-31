//
//  HomeInteractorTest.swift
//  SOLIDTests
//
//  Created by Serena Donato on 30/03/2023.
//

import XCTest
import PromiseKit
import UalaTesting
@testable import SOLID
@testable import UalaCore
import UalaUI

final class HomeInteractorTest: XCTestCase {
    func makeSut() -> (sut: HomeInteractor, spy: MockProfileRepository) {
        let mockProfile = MockProfileRepository()
        let enviroment = EnvironmentBuilder.create(.stage, .Argentina)
        let sut = HomeInteractor(profileRepo: mockProfile)
        CoreStarter.start(environment: enviroment)
        UIStarter.start(from: .init())
        ServiceLocator.sharedLocator.register({MockAPIManager() as BaseApiManager})
        return (sut, mockProfile)
    }
    
    func test_get_balance_success() throws {
        let (sut,spy) = makeSut()
        var balanceSpected = try Balance.dummy()
        spy.balanceSpy.stubbed = balanceSpected
        
        sut.getBalance { result in
            switch result {
            case .success(let balance):
                XCTAssertEqual(balance, balanceSpected)
            case .failure(_):
                XCTFail()
            }
        }
    }
    
    func test_get_balance_failure() throws {
        let (sut,spy) = makeSut()
        var errorSpected =  UalaError.undefined
        spy.balanceSpy.error = errorSpected
        
        sut.getBalance { result in
            switch result {
            case .success(_):
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, spy.balanceSpy.error?.localizedDescription)
            }
        }
    }
    
    func test_get_user_success() throws {
        let (sut,spy) = makeSut()
        var userSpected = User(email: "")
        spy.detailsSpy.stubbed = userSpected
        
        sut.getUser { result in
            switch result {
            case .success(let user):
                XCTAssertEqual(user, userSpected)
            case .failure(_):
                XCTFail()
            }
        }
    }
    
    func test_get_user_failure() throws {
        let (sut,spy) = makeSut()
        var errorSpected = UalaError.undefined
        spy.detailsSpy.error = errorSpected
        
        sut.getUser { result in
            switch result {
            case .success(_):
                XCTFail()
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, spy.detailsSpy.error?.localizedDescription)
            }
        }
    }
}

class MockProfileRepository: ProfileRepository {
    
    var detailsSpy: Spy<User, Void> = .init()
    override func details() -> Promise<User> {
        detailsSpy.onCall(parameters: ())
    }
    
    var balanceSpy: Spy<Balance, Void> = .init()
    override func balance() -> Promise<Balance> {
        balanceSpy.onCall(parameters: ())
    }
}

class MockAPIManager: BaseApiManager {}

extension Balance: UalaDummy {}

extension User: Equatable {
    public static func == (lhs: UalaCore.User, rhs: UalaCore.User) -> Bool {
        return lhs.email == rhs.email && lhs.userId == rhs.userId
    }
}

