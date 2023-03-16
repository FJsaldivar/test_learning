//
//  UIFareTabBarItem.swift
//  UalaFareUI
//
//  Created by Luis Perez on 28/11/22.
//

/// The tabbar item for the AbraTabBarController, each item is a selectable on the bottom tab
public struct AbraTabBarItem {
    public let viewController: UIViewController
    public let selectedStatusImage: UIImage
    public let deselectedStatusImage: UIImage
    public let title: String
    
    public init(viewController: UIViewController, selectedStatusImage: UIImage, deselectedStatusImage: UIImage, title: String) {
        self.viewController = viewController
        self.selectedStatusImage = selectedStatusImage
        self.deselectedStatusImage = deselectedStatusImage
        self.title = title
    }
}
