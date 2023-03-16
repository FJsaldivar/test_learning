//
//  DynamicInfoCellIcon.swift
//  UalaFareUI
//
//  Created by Luis Perez on 29/07/22.
//
import UIKit

/// The type of icons allowed in AbraCell
public enum AbraCellIconType {
    /// A number inside a circle, it receives the number to be displayed
    case bulletNumber(number: Int)
    /// An icon that suppors diferent sizes and can be rounded if nedded
    case icon(image: UIImage, size: ComponentSize, isRounded: Bool = false)
    
    var image: UIImage {
        switch self {
        case .icon(let image, _, _):
            return image
        case .bulletNumber:
            return UIImage()
        }
    }
    
    var size: CGSize {
        switch self {
        case .bulletNumber:
            return .zero
        case .icon(_, let size, _):
            switch size {
            case .small:
                return CGSize(width: 24,
                              height: 24)
            case .medium:
                return CGSize(width: 32,
                              height: 32)
            case .large:
                return CGSize(width: 40,
                              height: 40)
            }
        }
    }
    
    var edgeInsets: UIEdgeInsets {
        switch self {
        case .bulletNumber:
            return UIEdgeInsets(top: 0,
                                left: 0,
                                bottom: 0,
                                right: 0)
            
        case .icon(_, let size, _):
            switch size {
            case .small:
                return UIEdgeInsets(top: -3,
                                    left: -3,
                                    bottom: -3,
                                    right: -3)
                
            case .medium, .large:
                return UIEdgeInsets(top: 0,
                                    left: 0,
                                    bottom: 0,
                                    right: 0)
            }
        }
    }
}
