//
//  LoginRouter.swift
//  LoginExample
//
//  Created by Francisco Javier Saldivar Rubio on 29/10/22.
//

import UalaAuth

class LoginRouter: LoginDemoRouterType {
    var view: LoginDemoViewType?
    var isDeviseRegister: Bool
    
    func goNextScreen() {
        if isDeviseRegister {
            view?.navigationController?.pushViewController(HomeViewController(), animated: true)
        } else {
            view?.navigationController?.pushViewController(RegisterDivace(), animated: true)
        }
    }
    
    
}


// Mock
class MockLoginRouter: LoginRouter  {
    override func goNextScreen() {
    }
}

// Stub
class MockLoginRouter2: LoginRouter  {
    let stubisDeviseRegister: Bool
    override func goNextScreen() {
        if stubisDeviseRegister {
            view?.navigationController?.pushViewController(HomeViewController(), animated: true)
        } else {
            view?.navigationController?.pushViewController(RegisterDivace(), animated: true)
        }
    }
}

// Spy

// 1.- Verificar si es invocada
// 2.- Verifica cuantas veces es llamada una función
// 3.- Guarda los parametros recibios

class MockLoginRouter: LoginRouter  {
    
    var goNextScreenIsInvoked: Bool = false
    var goNextScreenInvokedCount: Int = 0
    var goNextScreenParameter: Void? = nil
    var goNextScreenStub: String!
    override func goNextScreen() -> String {
        goNextScreenIsInvoked = true
        goNextScreenInvokedCount += 1
        goNextScreenParameter = ()
        return goNextScreenStub
    }
}


// Sut


