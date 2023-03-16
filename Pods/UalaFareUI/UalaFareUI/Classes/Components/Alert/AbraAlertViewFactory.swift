//
//  AbraAlertViewFactory.swift
//  UalaFareUI
//
//  Created by Luis Perez on 24/11/22.
//

/// A protocol that when conformed provies a theme for an AbraAlertView depending of the type and theme
protocol AbraAlertViewThemeFactory {
    func theme(alertType: AbraAlertViewType, theme: Theme) -> AbraAlertViewTheme
}
