//
//  File.swift
//  LoginExample
//
//  Created by Francisco Javier Saldivar Rubio on 29/10/22.
//

import UalaAuth
import UalaUtils
import UalaCore

final class LoginEvents: LoginDemoPresenterEventsType {
    private let loginStatus: LoginStatusDefault = LoginStatusDefault()

    func get(error: Error) {
        LogManager.shared.debugError(error: error, type: self)
    }
    
    func loginSuccess(scheme: Scheme, country: CountryEnvironment, loginData: LoginData) async {
        LogManager.shared.debug(info: "Sheme -> \(scheme.rawValue)")
        LogManager.shared.debug(info: "Country -> \(country.rawValue)")
        loginStatus.setLoginStatus(isLogged: true)
    }
}

