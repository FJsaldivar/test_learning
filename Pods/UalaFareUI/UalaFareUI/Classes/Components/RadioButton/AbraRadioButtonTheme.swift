//
//  RadioButtonTheme.swift
//  UalaFareUI
//
//  Created by Luis Perez on 16/08/22.
//

/// The theme needed to display the radio button
public protocol AbraRadioButtonTheme {
    var selectedStateBackgroundColor: UIColor { get }
    var selectedStateDotColor: UIColor { get }
    var selectedStateBorderColor: UIColor { get }
    var deselectedStateDotColor: UIColor { get }
    var deselectedStateBorderColor: UIColor { get }
    var deselectedStateBackgroundColor: UIColor { get }
    var disabledDeselectedStateDotColor: UIColor { get }
    var disabledDeselectedStateBorderColor: UIColor { get }
    var disabledDeselectedStateBackgroundColor: UIColor { get }
    var disabledSelectedStateDotColor: UIColor { get }
    var disabledSelectedStateBorderColor: UIColor { get }
    var disabledSelectedStateBackgroundColor: UIColor { get }
}
