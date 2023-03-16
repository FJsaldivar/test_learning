//
//  DynamicCellDelegate.swift
//  UalaFareUI
//
//  Created by Luis Perez on 16/08/22.
//

/// The delegate of the AbraCell, it is needed to observe the events from the inputs
public protocol AbraCellDelegate: AnyObject {
    func actionChanged(action: AbraCellAction)
}
