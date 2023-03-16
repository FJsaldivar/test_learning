//
//  UalaButtonTheme.swift
//  UalaDSDemo
//
//  Created by Luis Perez on 04/07/22.
//

import UIKit

/// Holds the configuration for the diferent button status, including colors, typography and restrictions for icon or text
public protocol AbraButtonTheme {
    var enabledConfiguration: AbraButtonStatusConfiguration { get }
    var disabledConfiguration: AbraButtonStatusConfiguration { get }
    var pressedConfiguration: AbraButtonStatusConfiguration { get }
    var typographyStyle: TypographyStyle { get }
    var contentInsets: UIEdgeInsets { get }
    var cornerRadius: CGFloat { get }
    var showTitle: Bool { get }
    var showIcon: Bool { get }
    var iconSize: CGSize { get }
    var buttonPreferedSize: CGSize { get }
}
