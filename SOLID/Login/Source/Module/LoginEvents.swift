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
    private let logManager: LogManager
    private let loginStatus: LoginStatus
    
    init(logManager: LogManager = LogManager.shared, loginStatus: LoginStatus = LoginStatusDefault()) {
        self.logManager = logManager
        self.loginStatus = loginStatus
    }
    
    func get(error: Error) {
        logManager.debugError(error: error, type: self)
    }
    
    func loginSuccess(scheme: Scheme, country: CountryEnvironment, loginData: LoginData) async {
        logManager.debug(info: "Sheme -> \(scheme.rawValue)")
        logManager.debug(info: "Country -> \(country.rawValue)")
        loginStatus.setLoginStatus(isLogged: true)
    }
}

