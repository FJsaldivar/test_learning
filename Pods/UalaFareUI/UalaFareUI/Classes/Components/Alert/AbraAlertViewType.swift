//
//  AbraAlertViewType.swift
//  UalaFareUI
//
//  Created by Luis Perez on 24/11/22.
//

/// The type of the AbraAlertView, it receives a presentation style, the default is none
public enum AbraAlertViewType {
    /// Error type, use this when you need to display an error
    case error(presentationType: AbraAlertViewPresentationType = .none)
    /// Warning type, use this when you need to display a warning
    case warning(presentationType: AbraAlertViewPresentationType = .none)
    /// Information type, use this when you need to display the user with useful information
    case information(presentationType: AbraAlertViewPresentationType = .none)
    /// Success type, use this when you need to display a success message
    case success(presentationType: AbraAlertViewPresentationType = .none)
    /// Default type, use this when you want to display a simple message for the user
    case `default`(presentationType: AbraAlertViewPresentationType = .none)
    /// Security type, use this when you need to display a security related message
    case security
}
