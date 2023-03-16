//
//  Themeable+EXT.swift
//  UalaDSDemo
//
//  Created by Luis Perez on 29/06/22.
//

import UIKit

public extension ThemeObserver {
    func observeThemeUpdates() {
        NotificationCenter.default.addObserver(forName: AbraThemeManager.themeUpdateNotificationName,
                                               object: nil,
                                               queue: .main) { [weak self] _ in
            self?.updateTheme()
        }
    }
}
