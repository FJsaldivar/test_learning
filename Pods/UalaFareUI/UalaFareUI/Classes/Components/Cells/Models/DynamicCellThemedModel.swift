//
//  DynamicInformationCellThemedModel.swift
//  UalaFareUI
//
//  Created by Luis Perez on 27/07/22.
//

import UIKit

struct DynamicCellThemedModel: AbraCellThemedModel {
    var leftTitle: String?
    var leftSubtitle: String?
    var leftSeccondarySubtitle: String?
    var icon: AbraCellIconType?
    var rightTitle: String?
    var rightSubtitle: String?
    var rightTag: Tag?
    var shouldAddDivider: Bool
    var actionButton: AbraCellButtonType?
    var pressedCellBackgroundColor: UIColor
    var theme: AbraCellTheme
    var tagTheme: AbraTagTheme
    var switchTheme: AbraSwitchTheme
    var radioButtonTheme: AbraRadioButtonTheme
    var checkboxTheme: AbraCheckboxTheme
    var isSubtitleAtTop: Bool
}
