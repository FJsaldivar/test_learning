//
//  UIFareTabBarControllerThemeFactory.swift
//  UalaFareUI
//
//  Created by Luis Perez on 30/09/22.
//

/// The factory for the theme needed for the AbraTabBarController
protocol AbraTabBarControllerThemeFactory {
    func tabBarControllerTheme(theme: Theme) -> AbraTabBarControllerTheme
}

struct DefaultAbraTabBarControllerThemeFactory: AbraTabBarControllerThemeFactory {
    func tabBarControllerTheme(theme: Theme) -> AbraTabBarControllerTheme {
        return DefaultUIFareTabBarControllerTheme(normalConfiguration: normalConfiguration(theme: theme),
                                                  selectedConfiguration: selectedConfiguration(theme: theme),
                                                  centralButtonTheme: centralButtonTheme(theme: theme),
                                                  backgroundColor: .clear)
    }
    
    private func normalConfiguration(theme: Theme) -> AbraTabBarControllerConfiguration {
        return DefaultUIFareTabBarControllerConfiguration(font: deselectedFont(),
                                                          iconTintColor: theme.color(for: .neutralDark),
                                                          textColor: theme.color(for: .neutralDark),
                                                          textVerticalPositionAdjustment: -13)
    }
    
    private func selectedConfiguration(theme: Theme) -> AbraTabBarControllerConfiguration {
        return DefaultUIFareTabBarControllerConfiguration(font: selectedFont(),
                                                          iconTintColor: theme.color(for: .neutralDarker),
                                                          textColor: theme.color(for: .neutralDarker),
                                                          textVerticalPositionAdjustment: -13)
    }
    
    private func selectedFont() -> UIFont {
        let style = TypographyStyle.buttonSmBold
        guard let font = UIFont(family: style.attributes.fontFamily,
                                weight: style.attributes.fontWeight,
                                size: style.attributes.fontSize) else {
            return UIFont.systemFont(ofSize: style.attributes.fontSize.rawValue)
        }
        return font
    }
    
    private func deselectedFont() -> UIFont {
        let style = TypographyStyle.buttonSmRegular
        guard let font = UIFont(family: style.attributes.fontFamily,
                                weight: style.attributes.fontWeight,
                                size: style.attributes.fontSize) else {
            return UIFont.systemFont(ofSize: style.attributes.fontSize.rawValue)
        }
        return font
    }
    
    private func centralButtonTheme(theme: Theme) -> AbraButtonTheme {
        return theme.buttonTheme(for: .tabBar)
    }
}
