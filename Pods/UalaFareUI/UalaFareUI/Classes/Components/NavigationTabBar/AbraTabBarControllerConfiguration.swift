//
//  UIFareTabBarControllerConfiguration.swift
//  UalaFareUI
//
//  Created by Luis Perez on 28/11/22.
//

/// The configuration needed for the AbraTabBarController
public protocol AbraTabBarControllerConfiguration {
    var font: UIFont { get }
    var iconTintColor: UIColor { get }
    var textColor: UIColor { get }
    var textVerticalPositionAdjustment: CGFloat { get }
}
