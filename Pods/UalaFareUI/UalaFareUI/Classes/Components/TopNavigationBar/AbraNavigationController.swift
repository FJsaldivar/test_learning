//
//  AbraNavigationController.swift
//  UalaFareUI
//
//  Created by Luis Perez on 24/11/22.
//

import UIKit

/// A custom UINavigationController that allows updates on the navigation bar style
open class AbraNavigationController: UINavigationController {
    open var customStatusBarStyle: UIStatusBarStyle? {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return customStatusBarStyle ?? super.preferredStatusBarStyle
    }
}
