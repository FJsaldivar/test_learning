//
//  AppboyContentCardProvider.swift
//  UalaAnalytics
//
//  Created by Luis Perez on 09/05/22.
//

import Appboy_iOS_SDK

final class AppboyContentCardProvider: ContentCardProvider {
    private let provider: Appboy?
    
    init(provider: Appboy?) {
        self.provider = provider
    }
    
    convenience init() {
        self.init(provider: Appboy.sharedInstance())
    }
    
    func refreshContentCards() {
        provider?.requestContentCardsRefresh()
    }
    
    func contentCards() -> [ABKContentCard] {
        return provider?.contentCardsController.contentCards as? [ABKContentCard] ?? []
    }
}
