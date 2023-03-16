//
//  UalaTheme.swift
//  UalaDSDemo
//
//  Created by Luis Perez on 29/06/22.
//

import UIKit

public protocol Theme {
    func color(for color: ThemedColors) -> UIColor
    func globalColor(for color: GlobalColors) -> UIColor
    func themedHex(for color: ThemedColors) -> String
    func spacing(for spacing: Spacings) -> CGFloat
    func borderWidth(border: BorderWidth) -> BorderWidth
    func addShadow(to view: UIView)
    func addCornerRadius(to view: UIView)
    func toggleThemedModel() -> AbraSwitchTheme
    func buttonTheme(for type: AbraButtonType) -> AbraButtonTheme
    func cardTheme(cardType: AbraCardType) -> AbraCardModel
    func tagThemedModel(status: AbraTagStatus, size: ComponentSize) -> AbraTagTheme
    func radioButtonTheme() -> AbraRadioButtonTheme
    func checkboxTheme() -> AbraCheckboxTheme
    func themedDynamicInformationCellModel(for type: AbraCellType) -> AbraCellThemedModel
    // Inputs
    func textFieldTheme(placeholder: String?, rightIcon: Icon?, leftIcon: Icon?) -> TextFieldTheme
    func inputHelperTheme() -> InputHelperTheme
    func inputTextTheme(title: String?, helperText: String?, helperType: InputHelperType?, placeholder: String?, rightIcon: Icon?, leftIcon: Icon?) -> InputTextTheme
    func codeFieldTheme(length: Int, keyboardType: UIKeyboardType, isSecureText: Bool) -> CodeFieldTheme
    func inputAmountTheme(title: String?, fieldType: AmountFieldType, helperText: String?, helperType: InputHelperType?, currencySymbol: String, currencyLocaleIdentifier: String) -> InputAmountTheme
    func amountFieldTheme(fieldType: AmountFieldType, currencySymbol: String, currencyLocaleIdentifier: String) -> AmountFieldTheme
    func inputCodeField(length: Int, keyboardType: UIKeyboardType, isSecureText: Bool, helperText: String?, helperType: InputHelperType?) -> InputCodeTheme
    func tabBarControllerTheme() -> AbraTabBarControllerTheme
    func navigationBarAppearance(barType: NavigationBarType) -> NavigationBarAppearance
    func alertViewTheme(alertType: AbraAlertViewType) -> AbraAlertViewTheme
}
