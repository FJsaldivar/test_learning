//
//  AppboyUserDataTracker.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 09/05/22.
//

import Appboy_iOS_SDK

final class AppboyUserDataTracker: UserDataTracker {
    private let client: Appboy?
    
    init(client: Appboy?) {
        self.client = client
    }
    
    convenience init() {
        self.init(client: Appboy.sharedInstance())
    }
    
    func trackUserID(_ ID: String) {
        client?.changeUser(ID)
    }
    
    func tractUserFirstName(_ name: String) {
        client?.user.firstName = name
    }
    
    func trackUserLastName(_ lastName: String) {
        client?.user.lastName = lastName
    }
    
    func trackUserEmail(_ email: String) {
        client?.user.email = email
    }
    
    func trackUserPhone(_ phone: String) {
        client?.user.phone = phone
    }
    
    func trackUserImageURL(_ URL: String) {
        client?.user.avatarImageURL = URL
    }
    
    func trackUserStatus(_ status: String) {
        client?.user.addAlias("Status",
                              withLabel: status)
    }
    
    func trackUserBalance(_ balance: String) {
        client?.user.addAlias("balance",
                              withLabel: balance)
    }
}
