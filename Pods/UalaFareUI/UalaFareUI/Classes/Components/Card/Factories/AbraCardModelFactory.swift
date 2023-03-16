//
//  UIFareCardModelProvider.swift
//  UalaFareUI
//
//  Created by Luis Perez on 06/09/22.
//

/// A factory protocol for the AbraCardModel
public protocol AbraCardModelFactory {
    func themedModel(for type: AbraCardType, theme: Theme) -> AbraCardModel
}
