//
//  LightAbraAlertViewThemeFactory.swift
//  UalaFareUI
//
//  Created by Luis Perez on 24/11/22.
//

import UIKit

/// The factory for the AbraAlertViewTheme when the user is using a light theme.
struct LightAbraAlertViewThemeFactory: AbraAlertViewThemeFactory {
    func theme(alertType: AbraAlertViewType, theme: Theme) -> AbraAlertViewTheme {
        switch alertType {
        case .error(let presentationType):
            return errorTheme(presentationType: presentationType, theme: theme)
        case .warning(let presentationType):
            return warningTheme(presentationType: presentationType, theme: theme)
        case .information(let presentationType):
            return informationTheme(presentationType: presentationType, theme: theme)
        case .success(let presentationType):
            return successTheme(presentationType: presentationType, theme: theme)
        case .default(let presentationType):
            return defaultTheme(presentationType: presentationType, theme: theme)
        case .security:
            return securityTheme(theme: theme)
        }
    }
    
    private func securityTheme(theme: Theme) -> AbraAlertViewTheme {
        return DefaultAbraAlertViewTheme(backgroundColor: theme.color(for: .neutralWhite),
                                         borderColor: theme.color(for: .neutralWhite),
                                         titleColor: theme.color(for: .neutralDarker),
                                         titleTypographyStyle: titleTypographyStyle(for: .none),
                                         subtitleTypographyStyle: subtitleTypographyStyle(for: .none),
                                         subtitleColor: theme.color(for: .neutralDark),
                                         iconTintColor: theme.color(for: .primaryDefault))
    }
    
    private func defaultTheme(presentationType: AbraAlertViewPresentationType, theme: Theme) -> AbraAlertViewTheme {
        switch presentationType {
        case .toast:
            return DefaultAbraAlertViewTheme(backgroundColor: theme.color(for: .neutralWhite),
                                             borderColor: theme.color(for: .neutralLight),
                                             titleColor: theme.color(for: .neutralDarker),
                                             titleTypographyStyle: titleTypographyStyle(for: presentationType),
                                             subtitleTypographyStyle: subtitleTypographyStyle(for: presentationType),
                                             subtitleColor: theme.color(for: .neutralDark))
        case .none:
            return DefaultAbraAlertViewTheme(backgroundColor: .clear,
                                             borderColor: theme.color(for: .neutralLight),
                                             titleColor: theme.color(for: .neutralDarker),
                                             titleTypographyStyle: titleTypographyStyle(for: presentationType),
                                             subtitleTypographyStyle: subtitleTypographyStyle(for: presentationType),
                                             subtitleColor: theme.color(for: .neutralDark))
        }
    }
    
    private func successTheme(presentationType: AbraAlertViewPresentationType, theme: Theme) -> AbraAlertViewTheme {
        switch presentationType {
        case .toast:
            return DefaultAbraAlertViewTheme(backgroundColor: theme.color(for: .successLight),
                                             borderColor: theme.color(for: .successMiddle),
                                             titleColor: theme.color(for: .successDark),
                                             titleTypographyStyle: titleTypographyStyle(for: presentationType),
                                             subtitleTypographyStyle: subtitleTypographyStyle(for: presentationType),
                                             subtitleColor: theme.color(for: .successDark),
                                             iconTintColor: theme.color(for: .successDark))
        case .none:
            return DefaultAbraAlertViewTheme(backgroundColor: .clear,
                                             borderColor: theme.color(for: .successMiddle),
                                             titleColor: theme.color(for: .successMiddle),
                                             titleTypographyStyle: titleTypographyStyle(for: presentationType),
                                             subtitleTypographyStyle: subtitleTypographyStyle(for: presentationType),
                                             subtitleColor: theme.color(for: .successMiddle),
                                             iconTintColor: theme.color(for: .successMiddle))
        }
        
    }
    
    private func informationTheme(presentationType: AbraAlertViewPresentationType,
                                  theme: Theme) -> AbraAlertViewTheme {
        switch presentationType {
        case .toast:
            return DefaultAbraAlertViewTheme(backgroundColor: theme.color(for: .informationLight),
                                             borderColor: theme.color(for: .informationMiddle),
                                             titleColor: theme.color(for: .informationDark),
                                             titleTypographyStyle: titleTypographyStyle(for: presentationType),
                                             subtitleTypographyStyle: subtitleTypographyStyle(for: presentationType),
                                             subtitleColor: theme.color(for: .informationDark),
                                             iconTintColor: theme.color(for: .informationDark))
        case .none:
            return DefaultAbraAlertViewTheme(backgroundColor: .clear,
                                             borderColor: theme.color(for: .informationMiddle),
                                             titleColor: theme.color(for: .informationMiddle),
                                             titleTypographyStyle: titleTypographyStyle(for: presentationType),
                                             subtitleTypographyStyle: subtitleTypographyStyle(for: presentationType),
                                             subtitleColor: theme.color(for: .informationMiddle),
                                             iconTintColor: theme.color(for: .informationMiddle))
        }
    }
    
    private func warningTheme(presentationType: AbraAlertViewPresentationType,
                              theme: Theme) -> AbraAlertViewTheme {
        switch presentationType {
        case .toast:
            return DefaultAbraAlertViewTheme(backgroundColor: theme.color(for: .warningLight),
                                             borderColor: theme.color(for: .warningMiddle),
                                             titleColor: theme.color(for: .warningDark),
                                             titleTypographyStyle: titleTypographyStyle(for: presentationType),
                                             subtitleTypographyStyle: subtitleTypographyStyle(for: presentationType),
                                             subtitleColor: theme.color(for: .warningDark),
                                             iconTintColor: theme.color(for: .warningMiddle))
        case .none:
            return DefaultAbraAlertViewTheme(backgroundColor: .clear,
                                             borderColor: theme.color(for: .warningMiddle),
                                             titleColor: theme.color(for: .warningDark),
                                             titleTypographyStyle: titleTypographyStyle(for: presentationType),
                                             subtitleTypographyStyle: subtitleTypographyStyle(for: presentationType),
                                             subtitleColor: theme.color(for: .warningDark),
                                             iconTintColor: theme.color(for: .warningMiddle))
        }
    }
    
    private func errorTheme(presentationType: AbraAlertViewPresentationType,
                            theme: Theme) -> AbraAlertViewTheme {
        switch presentationType {
        case .toast:
            return DefaultAbraAlertViewTheme(backgroundColor: theme.color(for: .errorLight),
                                             borderColor: theme.color(for: .errorMiddle),
                                             titleColor: theme.color(for: .errorDark),
                                             titleTypographyStyle: titleTypographyStyle(for: presentationType),
                                             subtitleTypographyStyle: subtitleTypographyStyle(for: presentationType),
                                             subtitleColor: theme.color(for: .errorDark),
                                             iconTintColor: theme.color(for: .errorDark))
        case .none:
            return DefaultAbraAlertViewTheme(backgroundColor: .clear,
                                             borderColor: theme.color(for: .errorMiddle),
                                             titleColor: theme.color(for: .errorMiddle),
                                             titleTypographyStyle: titleTypographyStyle(for: presentationType),
                                             subtitleTypographyStyle: subtitleTypographyStyle(for: presentationType),
                                             subtitleColor: theme.color(for: .errorMiddle),
                                             iconTintColor: theme.color(for: .errorMiddle))
        }
    }
    
    private func titleTypographyStyle(for presentationType: AbraAlertViewPresentationType) -> TypographyStyle {
        switch presentationType {
        case .toast:
            return .labelMdBold
        case .none:
            return .titleXs
        }
    }
    
    private func subtitleTypographyStyle(for presentationType: AbraAlertViewPresentationType) -> TypographyStyle {
        return .bodySmRegular
    }
}
