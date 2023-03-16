//
//  DefaultUIFareCardTypographyProvider.swift
//  UalaFareUI
//
//  Created by Luis Perez on 08/09/22.
//

/// This factory provides the typography for the card depending of the type
final class DefaultAbraCardTypographyFactory: AbraCardTypographyFactory {
    func style(for cardType: AbraCardType, component: AbraCardComponent) -> TypographyStyle {
        switch component {
        case .title:
            switch cardType {
            case .amount:
                return .labelLgRegular
            case .verticalIconSmall, .avatarSmall:
                return .labelSmRegular
            case .quickAction:
                return .buttonSmBold
            default:
                return .titleXs
            }
        
        case .subtitle:
            switch cardType {
            case .horizontalIcon, .horizontalIconLarge, .verticalIconMiddle:
                return .bodyMdRegular
            case .verticalIconSmall:
                return .bodySmRegular
            case .amount:
                return .numberSmBold
            case .rating, .avatar:
                return .bodySmRegular
            case .quickAction:
                return .buttonSmBold
            default:
                return .bodyMdRegular
            }
            
        case .rating:
            return .bodySmRegular
        }
    }
}
