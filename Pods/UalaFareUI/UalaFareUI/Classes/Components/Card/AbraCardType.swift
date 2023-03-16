//
//  UIFareCardType.swift
//  UalaFareUI
//
//  Created by Luis Perez on 06/09/22.
//

/// The available types for the AbraCard
public enum AbraCardType: String {
    /// This type only shows an icon at the left and the text at the right side.
    case horizontalIcon
    /// This type shows a large icon at the left and a text at the right.
    case horizontalIconLarge
    /// This type shows an icon at the top and the text just below it
    case verticalIconMiddle
    /// This type shows an icon at the top and the text just below it
    case verticalIconSmall
    /// This type only shows an icon and no text
    case imageOnly
    /// This type shows text only
    case amount
    /// This type shows an image view at the top and the text below it
    case avatar
    /// This type shows an image view at the top and the text below it
    case avatarSmall
    /// This type shows an image view at the top, the text below it and s label showing an icon
    case rating
    /// This type shows an icon at top and and text below it
    case quickAction
}
