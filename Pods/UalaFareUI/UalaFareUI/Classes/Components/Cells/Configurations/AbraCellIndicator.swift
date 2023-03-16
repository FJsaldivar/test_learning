//
//  UIFareCellIndicator.swift
//  UalaFareUI
//
//  Created by Luis Perez on 01/09/22.
//

import UIKit

/// The indicator on the AbraCell, it is placed on the left side of the cell
public enum AbraCellIndicator {
    /// A bullet number indicator, it receives the number to be shown
    case bulletNumber(number: Int)
    /// An icon, it receives the image to be shown
    case icon(image: UIImage)
}
