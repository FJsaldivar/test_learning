//
//  UIFareLinkeableLabelDelegate.swift
//  UalaFareUI
//
//  Created by Luis Perez on 25/10/22.
//

/// This delegate gets notified when a user taps on a link on AbraLinkeableLabel
public protocol AbraLinkeableLabelDelegate: AnyObject {
    func userDidTappedOnLink(_ link: String)
}
