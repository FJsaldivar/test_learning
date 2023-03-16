//
//  AbraButtonType.swift
//  UalaFareUI
//
//  Created by Luis Perez on 05/12/22.
//

import UIKit

/// The type of the AbraButton, is used to create the AbraButtonTheme that holds the configuration for the button
public enum AbraButtonType: Equatable {
    /// Primary type, it receives the size of the button and a boolean to indicate if the background where its going to be placed contains color.
    case primary(size: ComponentSize, isOnDarkBackground: Bool = false)
    /// Seccondary type, it receives the size of the button and a boolean to indicate if the background where its going to be placed contains color.
    case seccondary(size: ComponentSize, isOnDarkBackground: Bool = false)
    /// Text only type, it receives the size of the button and a boolean to indicate if the background where its going to be placed contains color, this type will not show any icon setted to the button
    case textOnly(size: ComponentSize, isOnDarkBackground: Bool = false)
    /// icon only type, it receives a boolean to indicate if the background where its going to be placed contains color, it will not show any text setted into the button
    case iconOnly(isOnDarkBackground: Bool = false)
    /// tabbar type, this type is used when setting the central button for the AbraTabBarController
    case tabBar
    /// link type, use this when your button opens a link to a website
    case link
    
    /// The size of the component
    public var size: ComponentSize {
        switch self {
        case .primary(let size, _):
            return size
        case .seccondary(let size, _):
            return size
        case .textOnly(let size, _):
            return size
        case .iconOnly:
            return .large
        case .tabBar:
            return .small
        case .link:
            return .small
        }
    }
    
    /// The height of the component
    public var height: CGFloat {
        return self.preferedSize.height
    }
    
    /// The width of the component
    public var width: CGFloat? {
        switch self {
        case .primary(let size, _):
            switch size {
            case .small:
                return nil
            default:
                return 320
            }
        
        case .seccondary(let size, _):
            switch size {
            case .small:
                return nil
            default:
                return 320
            }
        
        case .textOnly(let size, _):
            switch size {
            case .small:
                return nil
            default:
                return 320
            }
            
        case .tabBar, .iconOnly:
            return 48
        case .link:
            return nil
        }
    }
    
    /// The prefered size of the button, use this size only for the height in primary, seccondary and text only types, use the complete size for tabbar and iconOnly
    private var preferedSize: CGSize {
        switch self {
        case .primary(let size, _):
            if size == .small {
                return CGSize(width: 105, height: 32)
            }
            return CGSize(width: 320, height: 48)
            
        case .seccondary(let size, _):
            if size == .small {
                return CGSize(width: 105, height: 32)
            }
            return CGSize(width: 320, height: 48)
            
        case .textOnly(let size, _):
            if size == .small {
                return CGSize(width: 105, height: 32)
            }
            return CGSize(width: 320, height: 48)
            
        case .tabBar, .iconOnly:
            return CGSize(width: 48, height: 48)
        case .link:
            return .zero
        }
    }
    
    internal var isPlacedOnDarkBackground: Bool {
        switch self {
        case .primary(_, let isOnDarkBackground):
            return isOnDarkBackground
        case .seccondary(_, let isOnDarkBackground):
            return isOnDarkBackground
        case .textOnly(_, let isOnDarkBackground):
            return isOnDarkBackground
        case .iconOnly(let isOnDarkBackground):
            return isOnDarkBackground
        case .tabBar, .link:
            return false
        }
    }
    
    public static func == (lhs: AbraButtonType, rhs: AbraButtonType) -> Bool {
        let leftTypeDescription = String(describing: lhs)
        let rightTypeDescription = String(describing: rhs)
        
        return leftTypeDescription == rightTypeDescription &&
        lhs.size == rhs.size
    }
}
