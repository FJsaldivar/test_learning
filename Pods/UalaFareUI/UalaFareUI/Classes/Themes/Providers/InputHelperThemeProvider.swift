//
//  InputHelperThemeProvider.swift
//  UalaFareUI
//
//  Created by Matías Schwalb on 21/07/2022.
//

public protocol InputHelperThemeProvider {
    func theme() -> InputHelperTheme
}

public final class DefaultInputHelperThemeProvider: InputHelperThemeProvider {
    
    public init() {}
    
    public func theme() -> InputHelperTheme {
        return DefaultInputHelperTheme(helperLabelTypography: .labelSmRegular,
                                       informationConfiguration: getConfiguration(for: .information),
                                       successConfiguration: getConfiguration(for: .success),
                                       warningConfiguration: getConfiguration(for: .warning),
                                       errorConfiguration: getConfiguration(for: .error),
                                       standardConfiguration: getConfiguration(for: .standard),
                                       disabledConfiguration: getConfiguration(for: .disabled))
    }
    
    public func getConfiguration(for type: InputHelperType) -> InputHelperConfiguration {
        switch type {
        case .information:
            return DefaultInputHelperConfiguration(icon: UIImage(withAsset: DefaultIcons.infoCircle),
                                                   tint: AbraThemeManager.theme.color(for: .informationMiddle))
        case .success:
            return DefaultInputHelperConfiguration(icon: UIImage(withAsset: DefaultIcons.checkCircle),
                                                   tint: AbraThemeManager.theme.color(for: .successMiddle))
        case .warning:
            return DefaultInputHelperConfiguration(icon: UIImage(withAsset: DefaultIcons.warningCircle),
                                                   tint: AbraThemeManager.theme.color(for: .warningMiddle))
        case .error:
            return DefaultInputHelperConfiguration(icon: UIImage(withAsset: DefaultIcons.deniedCircle),
                                                   tint: AbraThemeManager.theme.color(for: .errorMiddle))
        case .standard:
            return DefaultInputHelperConfiguration(icon: nil,
                                                   tint: AbraThemeManager.theme.color(for: .neutralDark))
        case .disabled:
            return DefaultInputHelperConfiguration(icon: nil,
                                                   tint: AbraThemeManager.theme.color(for: .neutralMiddle))
        }
    }
}
