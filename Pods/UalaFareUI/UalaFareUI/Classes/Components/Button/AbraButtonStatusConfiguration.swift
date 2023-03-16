//
//  AbraButtonStatusConfiguration.swift
//  UalaFareUI
//
//  Created by Luis Perez on 05/12/22.
//
import UIKit

/// Holds the configuration for any status of the AbraButton (pressed, disabled, etc)
public protocol AbraButtonStatusConfiguration {
    var backgroundColor: UIColor { get }
    var labelColor: UIColor { get }
    var iconTintColor: UIColor { get }
    var borderColor: UIColor { get }
    var borderWidth: CGFloat { get }
}
