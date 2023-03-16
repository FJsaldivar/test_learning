//
//  DynamicInfoCellType.swift
//  UalaFareUI
//
//  Created by Luis Perez on 29/07/22.
//

/// The types allowed in the AbraCell
public enum AbraCellType {
    /// This cell has no inputs, it displays text and information only, the user tap is still handled by the UITableViewDelegate
    case simpleNonActionable(leftTitle: String?,
                             leftSubtitle: String?,
                             rightTitle: String?,
                             rightSubtitle: String?,
                             leftIndicator: AbraCellIndicator?,
                             size: AbraCellSize,
                             swapTitleWithSubtitle: Bool,
                             showSeparator: Bool = true)
    
    /// This cell has an input on the right side, you can observe the events on the input by setting the delegate on the cell
    case simpleActionable(leftTitle: String?,
                          leftSubtitle: String?,
                          leftIndicator: AbraCellIndicator?,
                          button: AbraCellButtonType,
                          size: AbraCellSize,
                          swapTitleWithSubtitle: Bool,
                          showSeparator: Bool = true)
    
    /// This cell can have an input on the right side, you can observe the events on the input by setting the delegate on the cell
    case movement(leftTitle: String?,
                  leftSubtitle: String,
                  icon: UIImage,
                  rightTitle: String?,
                  rigthSubtitle: String?,
                  status: AbraMovementCellStatus = .none,
                  rightButton: AbraCellButtonType? = nil,
                  showSeparator: Bool = true)
    
    /// This cell can have an input and a tag on the right side, both are optionals, you can observe the events on the input by setting the delegate on the cell
    case avatar(leftTitle: String?,
                leftSubtitle: String,
                leftSeccondarySubtitle: String?,
                icon: UIImage,
                rightTitle: String?,
                rightSubtitle: String?,
                rightTag: (text: String, status: AbraTagStatus)?,
                button: AbraCellButtonType?,
                showSeparator: Bool = true)
    
    /// This cell has a checkbox for input, you can observe the events by setting the delegate on the cell
    case checkbox(leftTitle: String?,
                  leftSubtitle: String?,
                  rightTitle: String?,
                  rightSubtitle: String?,
                  size: ComponentSize,
                  showSeparator: Bool = false)
    
    /// This cell type has a radio button as input, you can observe the events by setting the delegate on the cell
    case radioButton(leftTitle: String?,
                     leftSubtitle: String?,
                     rightTitle: String? = nil,
                     rightSubtitle: String? = nil,
                     size: ComponentSize,
                     showSeparator: Bool = false)
    
    /// This cell type has a switch for input, you can observe the events by setting the delegate on the cell
    case switchButton(title: String?,
                      subtitle: String?,
                      icon: UIImage)
    
    /// This cell has a tag on the right side, it doesn't have any inputs but can still be tapped
    case tag(title: String?,
             subtitle: String?,
             icon: UIImage,
             tag: (text: String, status: AbraTagStatus),
             showSeparator: Bool)
    
    /// This cell type has a chevron as an icon in the right side, doesn't have an input
    case chevron(title: String?,
                 subtitle: String?,
                 swapTitleWithSubtitle: Bool,
                 leftIndicator: AbraCellIndicator?)
}
