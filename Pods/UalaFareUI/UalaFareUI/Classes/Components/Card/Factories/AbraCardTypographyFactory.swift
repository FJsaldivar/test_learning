//
//  UIFareCardTypographyProvider.swift
//  UalaFareUI
//
//  Created by Luis Perez on 06/09/22.
//

/// This factory provides the typography for the card depending of the type
public protocol AbraCardTypographyFactory {
    func style(for cardType: AbraCardType, component: AbraCardComponent) -> TypographyStyle
}
