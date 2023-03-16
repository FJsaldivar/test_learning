//
//  DynamicCellAction.swift
//  UalaFareUI
//
//  Created by Luis Perez on 16/08/22.
//

/// The posible actions by an AbraCell
public enum AbraCellAction {
    /// Action called when the action button is pressed
    case actionButtonPressed(indexPath: IndexPath)
    /// Action called when the switch on the cell is pressed, it returns the indexPath and the switch status
    case switchStatusChanged(indexPath: IndexPath, isActive: Bool)
    /// Action called when the checkbox on the cell is pressed, it returns the indexPath and the checkbox status
    case checkboxStatusChanged(indexPath: IndexPath, isActive: Bool)
    /// Action called when the radio button is pressed, it returns the indexPath of the selected radio button
    case radioButtonSelected(indexPath: IndexPath)
}
