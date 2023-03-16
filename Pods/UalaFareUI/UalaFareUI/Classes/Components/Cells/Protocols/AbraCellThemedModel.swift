//
//  DynamicInformationTableViewCellModel.swift
//  UalaFareUI
//
//  Created by Luis Perez on 27/07/22.
//

/// The model with all the info to display on the AbraCell
public protocol AbraCellThemedModel {
    typealias Tag = (text: String, status: AbraTagStatus)
    var leftTitle: String? { get }
    var leftSubtitle: String? { get }
    var leftSeccondarySubtitle: String? { get }
    var icon: AbraCellIconType? { get }
    var rightTitle: String? { get }
    var rightSubtitle: String? { get }
    var rightTag: Tag? { get }
    var shouldAddDivider: Bool { get }
    var actionButton: AbraCellButtonType? { get }
    var pressedCellBackgroundColor: UIColor { get }
    var theme: AbraCellTheme { get }
    var tagTheme: AbraTagTheme { get }
    var switchTheme: AbraSwitchTheme { get }
    var radioButtonTheme: AbraRadioButtonTheme { get }
    var checkboxTheme: AbraCheckboxTheme { get }
    var isSubtitleAtTop: Bool { get }
}
