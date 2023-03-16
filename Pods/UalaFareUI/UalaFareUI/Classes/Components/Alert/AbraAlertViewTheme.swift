//
//  AbraAlertViewTheme.swift
//  UalaFareUI
//
//  Created by Luis Perez on 24/11/22.
//

/// A protocol that provides the style and colors for the AbraAlertView
public protocol AbraAlertViewTheme {
    var backgroundColor: UIColor { get }
    var borderColor: UIColor { get }
    var titleColor: UIColor { get }
    var titleTypographyStyle: TypographyStyle { get }
    var subtitleTypographyStyle: TypographyStyle { get }
    var subtitleColor: UIColor { get }
    var iconTintColor: UIColor? { get }
}
