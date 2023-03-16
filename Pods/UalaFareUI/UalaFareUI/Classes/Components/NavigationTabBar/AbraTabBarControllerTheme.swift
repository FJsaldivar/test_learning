//
//  UIFareTabBarControllerTheme.swift
//  UalaFareUI
//
//  Created by Luis Perez on 28/11/22.
//

/// The theme needed for the AbraTabBarController
public protocol AbraTabBarControllerTheme {
    var normalConfiguration: AbraTabBarControllerConfiguration { get }
    var selectedConfiguration: AbraTabBarControllerConfiguration { get }
    var centralButtonTheme: AbraButtonTheme { get }
    var backgroundColor: UIColor { get }
}
