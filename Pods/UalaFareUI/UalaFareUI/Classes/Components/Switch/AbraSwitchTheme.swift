//
//  UIFareSwitchModel.swift
//  UalaDSDemo
//
//  Created by Luis Perez on 04/07/22.
//
import UIKit

/// The theme configuration needed to display the switch correctly
public protocol AbraSwitchTheme {
    var onColor: UIColor { get }
    var offColor: UIColor { get }
    var disabledOnColor: UIColor { get }
    var disabledOffColor: UIColor { get }
    var thumbColor: UIColor { get }
}
