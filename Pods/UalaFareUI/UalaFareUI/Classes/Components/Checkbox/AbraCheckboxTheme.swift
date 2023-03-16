//
//  CheckboxTheme.swift
//  UalaFareUI
//
//  Created by Luis Perez on 16/08/22.
//

/// The theme for the customization of the Abra Checkbox
public protocol AbraCheckboxTheme {
    var unselectedBackgroundColor: UIColor { get }
    var selectedBackgroundColor: UIColor { get }
    var unselectedBorderColor: UIColor { get }
    var selectedBorderColor: UIColor { get }
    var iconTintColor: UIColor { get }
    var disabledSelectedBackgroundColor: UIColor { get }
    var disabledBorderColor: UIColor { get }
    var icon: UIImage { get }
}
