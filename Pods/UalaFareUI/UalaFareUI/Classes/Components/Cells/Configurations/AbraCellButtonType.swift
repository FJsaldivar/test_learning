//
//  DynamicInformationCellButton.swift
//  UalaFareUI
//
//  Created by Luis Perez on 29/07/22.
//

/// The type of buttons allowed in the AbraCell
public enum AbraCellButtonType {
    /// A button with text only
    case text(text: String)
    /// A button with icon only
    case icon(image: UIImage)
    /// A switch
    case `switch`
    /// A checkbox that supports diferent sizes
    case checkBox(size: ComponentSize)
    /// A radio button that supports diferent sizes
    case radio(size: ComponentSize)
}
